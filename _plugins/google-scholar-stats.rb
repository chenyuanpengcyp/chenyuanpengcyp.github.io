require 'nokogiri'
require 'open-uri'
require 'json'

module Jekyll
  module GoogleScholar
    CACHE_FILE = '.google_scholar_cache.json'
    CACHE_DURATION = 86_400 # 24 hours in seconds

    module_function

    def stats_for(scholar_id)
      raise 'Invalid scholar_id provided' if scholar_id.nil? || scholar_id.empty?

      cached = read_cache(scholar_id)
      return cached if cached

      stats = fetch_scholar_stats(scholar_id)
      write_cache(scholar_id, stats)
      stats
    end

    def read_cache(scholar_id)
      return nil unless File.exist?(CACHE_FILE)

      begin
        cache = JSON.parse(File.read(CACHE_FILE))
        entry = cache[scholar_id]
        if entry && Time.now.to_i - entry['timestamp'] < CACHE_DURATION
          entry['data']
        end
      rescue JSON::ParserError
        nil
      end
    end

    def write_cache(scholar_id, stats)
      cache = {}

      if File.exist?(CACHE_FILE)
        begin
          cache = JSON.parse(File.read(CACHE_FILE))
        rescue JSON::ParserError
          # ignore corrupted cache
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
        doc = Nokogiri::HTML(
          URI.open(
            profile_url,
            'User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
          )
        )

        stats = {}

        # Extract citation statistics from the table
        citation_table = doc.css('#gsc_rsb_st')
        if citation_table
          rows = citation_table.css('tr')
          stats['citations'] = rows[1]&.css('td')&.[](1)&.text&.strip
          stats['h_index'] = rows[2]&.css('td')&.[](1)&.text&.strip
          stats['i10_index'] = rows[3]&.css('td')&.[](1)&.text&.strip
        end

        # Count total number of papers
        paper_count = doc.css('#gsc_a_b .gsc_a_tr').length

        # Check if there's a "Show more" button indicating more papers
        show_more_button = doc.css('#gsc_bpf_more')

        if show_more_button && !show_more_button.empty?
          # Try to get the total count from the page
          total_text = doc.css('.gsc_a_nn').text
          if total_text =~ /of (\d+)/
            stats['papers'] = $1
          else
            # Fetch all papers by clicking "Show more" (simulate with pagesize parameter)
            all_papers_url = "https://scholar.google.com/citations?user=#{scholar_id}&hl=en&pagesize=100&sortby=pubdate"
            sleep(rand(2.0..3.0))

            all_doc = Nokogiri::HTML(
              URI.open(
                all_papers_url,
                'User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
              )
            )

            stats['papers'] = all_doc.css('#gsc_a_b .gsc_a_tr').length.to_s
          end
        else
          stats['papers'] = paper_count.to_s
        end

        stats.to_json
      rescue Exception => e
        puts "Error fetching Google Scholar stats for #{scholar_id}: #{e.class} - #{e.message}"

        {
          'citations' => 'N/A',
          'h_index' => 'N/A',
          'i10_index' => 'N/A',
          'papers' => 'N/A'
        }.to_json
      end
    end
  end

  module GoogleScholarStatsFilter
    def google_scholar_stats(scholar_id)
      Jekyll::GoogleScholar.stats_for(scholar_id)
    end
  end

  class GoogleScholarStatsTag < Liquid::Tag
    def initialize(tag_name, params, tokens)
      super
      @scholar_id = params.strip
    end

    def render(context)
      scholar_id = context[@scholar_id] || @scholar_id
      Jekyll::GoogleScholar.stats_for(scholar_id)
    end
  end

  class GoogleScholarStat < Liquid::Tag
    def initialize(tag_name, params, tokens)
      super
      parts = params.strip.split(' ')
      @stats_json = parts[0]
      @field = parts[1]

      raise 'Field name is required (citations, h_index, i10_index, papers)' if @field.nil? || @field.empty?
    end

    def render(context)
      stats_json = context[@stats_json]

      begin
        stats = JSON.parse(stats_json)
        stats[@field] || 'N/A'
      rescue
        'N/A'
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::GoogleScholarStatsFilter)
Liquid::Template.register_tag('google_scholar_stats', Jekyll::GoogleScholarStatsTag)
Liquid::Template.register_tag('scholar_stat', Jekyll::GoogleScholarStat)
