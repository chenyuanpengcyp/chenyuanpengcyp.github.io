require "active_support/all"
require 'nokogiri'
require 'open-uri'
require 'json'

module Jekyll
  class GoogleScholarProfileTag < Liquid::Tag
    # Cache the profile statistics to avoid multiple fetches
    @@profile_stats = {}

    def initialize(tag_name, params, tokens)
      super
      @scholar_id = params.strip
      @stat_type = nil # Will be set in render
    end

    def render(context)
      scholar_id = context[@scholar_id.strip] || @scholar_id.strip
      
      # Extract the stat_type from the tag name
      @stat_type = @tag_name.split('_').last
      
      # Return from cache if already fetched
      if @@profile_stats[scholar_id] && @@profile_stats[scholar_id][@stat_type]
        return @@profile_stats[scholar_id][@stat_type].to_s
      end
      
      # If we have some stats but not this specific one, don't fetch again
      if @@profile_stats[scholar_id] && @stat_type != 'fetch'
        return "N/A"
      end
      
      # Initialize cache for this scholar_id if not already done
      @@profile_stats[scholar_id] ||= {}
      
      # Only fetch if this is the first call or an explicit fetch call
      if @stat_type == 'fetch' || @@profile_stats[scholar_id].empty?
        fetch_profile_stats(scholar_id)
      end
      
      # Return the requested stat (or empty string for fetch)
      if @stat_type == 'fetch'
        return ""
      else
        return @@profile_stats[scholar_id][@stat_type].to_s
      end
    end
    
    private
    
    def fetch_profile_stats(scholar_id)
      profile_url = "https://scholar.google.com/citations?user=#{scholar_id}&hl=en"
      
      begin
        # Sleep for a random amount of time to avoid being blocked
        sleep(rand(1.5..3.5))
        
        # Fetch the profile page
        doc = Nokogiri::HTML(URI.open(profile_url, "User-Agent" => "Ruby/#{RUBY_VERSION}"))
        
        # Extract the citation stats
        stats_table = doc.css('table#gsc_rsb_st')
        if stats_table.empty?
          puts "Error: Could not find citation stats table for Google Scholar ID: #{scholar_id}"
          return
        end
        
        # Initialize with default values
        @@profile_stats[scholar_id] = {
          'citations' => 0,
          'h_index' => 0,
          'i10_index' => 0
        }
        
        # Extract values from the table (look for the "All" row)
        rows = stats_table.css('tr')
        rows.each do |row|
          cells = row.css('td')
          next if cells.empty?
          
          label = cells[0].text.strip.downcase
          value = cells[1].text.strip.to_i
          
          if label.include?('citations')
            @@profile_stats[scholar_id]['citations'] = value
          elsif label.include?('h-index')
            @@profile_stats[scholar_id]['h_index'] = value
          elsif label.include?('i10-index')
            @@profile_stats[scholar_id]['i10_index'] = value
          end
        end
        
      rescue Exception => e
        puts "Error fetching Google Scholar profile stats for #{scholar_id}: #{e.class} - #{e.message}"
        @@profile_stats[scholar_id] = {
          'citations' => 'N/A',
          'h_index' => 'N/A',
          'i10_index' => 'N/A'
        }
      end
    end
  end
end

# Register tags for each statistic type
Liquid::Template.register_tag('google_scholar_citations_fetch', Jekyll::GoogleScholarProfileTag)
Liquid::Template.register_tag('google_scholar_citations_count', Jekyll::GoogleScholarProfileTag)
Liquid::Template.register_tag('google_scholar_h_index', Jekyll::GoogleScholarProfileTag)
Liquid::Template.register_tag('google_scholar_i10_index', Jekyll::GoogleScholarProfileTag) 