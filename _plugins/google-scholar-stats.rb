require 'nokogiri'
require 'open-uri'
require 'json'

module Jekyll
  class GoogleScholarStatsTag < Liquid::Tag
    CACHE_FILE = '.google_scholar_cache.json'
    CACHE_DURATION = 86400 # 24 hours in seconds

    def initialize(tag_name, params, tokens)
      super
      @scholar_id = params.strip
      
      if @scholar_id.nil? || @scholar_id.empty?
        raise "Invalid scholar_id provided"
      end
    end

    def render(context)
      scholar_id = context[@scholar_id] || @scholar_id
      
      # Check cache first
      cached_data = read_cache(scholar_id)
      return cached_data if cached_data

      # Fetch fresh data
      stats = fetch_scholar_stats(scholar_id)
      
      # Cache the results
      write_cache(scholar_id, stats)
      
      return stats
    end

    private

    def read_cache(scholar_id)
      return nil unless File.exist?(CACHE_FILE)
      
      begin
        cache = JSON.parse(File.read(CACHE_FILE))
        entry = cache[scholar_id]
        
        return nil unless entry
        
        # Check if cache is still valid
        if Time.now.to_i - entry['timestamp'] < CACHE_DURATION
          return entry['data']
        end
      rescue JSON::ParserError
        # Invalid cache file, return nil
      end
      
      nil
    end

    def write_cache(scholar_id, stats)
      cache = {}
      
      if File.exist?(CACHE_FILE)
        begin
          cache = JSON.parse(File.read(CACHE_FILE))
        rescue JSON::ParserError
          # Start with empty cache if file is corrupted
        end
      end
      
      cache[scholar_id] = {
        'timestamp' => Time.now.to_i,
        'data' => stats
      }
      
      File.write(CACHE_FILE, JSON.pretty_generate(cache))
    end

    def fetch_scholar_stats(scholar_id)
      profile_url = "https://scholar.google.com/citations?user=#{scholar_id}&hl=en"
      
      begin
        # Add delay to avoid being blocked
        sleep(rand(2.0..4.0))
        
        # Fetch the profile page
        doc = Nokogiri::HTML(URI.open(profile_url, 
          "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"))
        
        stats = {}
        
        # Extract citation statistics from the table
        citation_table = doc.css('#gsc_rsb_st')
        if citation_table
          rows = citation_table.css('tr')
          
          # Citations row (second row)
          if rows[1]
            citations_all = rows[1].css('td')[1].text.strip
            stats['citations'] = citations_all
          end
          
          # h-index row (third row)
          if rows[2]
            h_index_all = rows[2].css('td')[1].text.strip
            stats['h_index'] = h_index_all
          end
          
          # i10-index row (fourth row)
          if rows[3]
            i10_index_all = rows[3].css('td')[1].text.strip
            stats['i10_index'] = i10_index_all
          end
        end
        
        # Count total number of papers
        paper_count = doc.css('#gsc_a_b .gsc_a_tr').length
        
        # Check if there's a "Show more" button indicating more papers
        show_more_button = doc.css('#gsc_bpf_more')
        
        if show_more_button && !show_more_button.empty?
          # Try to get the total count from the page
          # Sometimes Google Scholar shows "Articles 1-20 of X" text
          total_text = doc.css('.gsc_a_nn').text
          if total_text =~ /of (\d+)/
            stats['papers'] = $1
          else
            # Fetch all papers by clicking "Show more" (simulate with pagesize parameter)
            all_papers_url = "https://scholar.google.com/citations?user=#{scholar_id}&hl=en&pagesize=100&sortby=pubdate"
            sleep(rand(2.0..3.0))
            
            all_doc = Nokogiri::HTML(URI.open(all_papers_url, 
              "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"))
            
            all_paper_count = all_doc.css('#gsc_a_b .gsc_a_tr').length
            stats['papers'] = all_paper_count.to_s
          end
        else
          stats['papers'] = paper_count.to_s
        end
        
        return stats.to_json
        
      rescue Exception => e
        puts "Error fetching Google Scholar stats for #{scholar_id}: #{e.class} - #{e.message}"
        
        # Return placeholder values on error
        return {
          'citations' => 'N/A',
          'h_index' => 'N/A',
          'i10_index' => 'N/A',
          'papers' => 'N/A'
        }.to_json
      end
    end
  end

  class GoogleScholarStat < Liquid::Tag
    def initialize(tag_name, params, tokens)
      super
      parts = params.strip.split(' ')
      @stats_json = parts[0]
      @field = parts[1]
      
      if @field.nil? || @field.empty?
        raise "Field name is required (citations, h_index, i10_index, papers)"
      end
    end

    def render(context)
      stats_json = context[@stats_json]
      
      begin
        stats = JSON.parse(stats_json)
        return stats[@field] || 'N/A'
      rescue
        return 'N/A'
      end
    end
  end
end

Liquid::Template.register_tag('google_scholar_stats', Jekyll::GoogleScholarStatsTag)
Liquid::Template.register_tag('scholar_stat', Jekyll::GoogleScholarStat)