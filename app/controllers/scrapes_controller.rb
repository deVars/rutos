class ScrapesController < ApplicationController
	def new

	end

	def index
		@arr = Array.new

		@dog = Hash.new
		@dog['message'] = 'Success'

		@cat = Hash.new
		@cat['meow'] = 'meow~'

		@arr.push(@dog)
		@arr.push(@cat)

		@json = @arr
	end

	def get
		list = Scrape.select(:id, :subber, :title, :resolution, :bit_encoding, :was_downloaded)
			.order(publish_date: :desc)
			.limit(50)
		list = list.where("title LIKE ?", "%#{params[:title]}%") unless params[:title] == nil
		list = list.where("subber = ?", params[:subber]) unless params[:subber] == nil
		list = list.where("resolution = ?", params[:resolution]) unless params[:resolution] == nil
		
		list.each do |entry| 
			entry.title = entry.title.gsub(/\[.*?\]/, "").gsub(/\_/, " ") unless entry.title == nil
		end	

		@json = list
	end

	def get_subbers
		@json = Scrape.select(:subber).distinct
	end

	def get_link
		list = Scrape.select(:id, :url).find(params[:id])

		@json = list
	end

	def raw
		feed = Feedjira::Feed.fetch_and_parse 'http://devars.duckdns.org/static/sample.rss'
		@json = feed.entries[0]
	end
end
