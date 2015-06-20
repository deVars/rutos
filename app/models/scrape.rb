class Scrape < ActiveRecord::Base

	def self.gather
		# feed = Feedjira::Feed.fetch_and_parse 'http://www.nyaa.se/?page=rss&cats=1_37&filter=2'
		feed = Feedjira::Feed.fetch_and_parse 'http://devars.duckdns.org/static/sample.rss'
		entry_list = []
		feed.entries.each do |entry|
			matches = /^\[([^\]]+)\](?:\s|_)*([^.]+)?/.match(entry.title)

			if matches.nil? 
				logger.warn 'test didn\'t match ' + entry.title
			end

			unless matches.nil?
				entry_item = Hash.new
				title = matches[2]
				resolution = ScrapesHelper.get_resolution title

				entry_item[:subber] = matches[1] || 'unknown'
				entry_item[:title] = title
				entry_item[:resolution] = resolution
				entry_item[:bit_encoding] = ScrapesHelper.get_bit_encoding title
				entry_item[:url] = entry.url
				entry_item[:was_downloaded] = false
				entry_item[:publish_date] = ScrapesHelper.format_published_date entry.published

				Scrape.create(entry_item) unless Scrape.exists? title: title

				entry_list << entry_item
			end
		end

		logger.info "gather complete"
		# @json = {:success => true}
	end

	def self.test
		logger.info 'whenever has triggered'
	end

end
