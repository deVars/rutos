class ScrapesController < ApplicationController
	def new

	end

	def server_download
		@json = {success: false}
		list = Scrape.select(:id, :title, :url).find(params[:id])
		return @json if list.nil? || session[:user_id] == nil

		response = Faraday.get list.url
		download_path = ENV['RUTOS_DOWNLOAD_PATH']
		download_path = './' if download_path.nil?

		list.was_downloaded = true
		list.save

		File.open(download_path + list.title + '.torrent', 'wb') {|fp| fp.write(response.body)}

		@json = {success: true}
	end

	def get_default_list
		list = Scrape.select(:id, :subber, :title, :resolution, :bit_encoding, :was_downloaded)
			.order(publish_date: :desc)
			.limit(50)

		list
	end

	def get
		list = get_default_list
		list = list.where("title LIKE ?", "%#{params[:title]}%") unless params[:title] == nil
		list = list.where("subber = ?", params[:subber]) unless params[:subber] == nil
		list = list.where("resolution = ?", params[:resolution]) unless params[:resolution] == nil
		
		list.each do |entry| 
			entry.title = entry.title.gsub(/\[.*?\]/, "").gsub(/\_/, " ") unless entry.title == nil
		end	

		@json = list
	end

	def get_fav
		list = get_default_list
		where_clauses = [];
		# where_template = "(title LIKE ? AND subber LIKE ? AND resolution = ?) OR "

		Fav.all.each do |crit|
			title = "title LIKE '%#{crit[:title]}%'"
			subber = "subber LIKE '%#{crit[:subber]}%'"
			resolution = "resolution = #{crit[:resolution]}"
			
			statement = [title, subber, resolution]
			where_template = "(#{statement.join(' AND ')})"
			where_clauses << where_template
		end

		list = list.where(where_clauses.join(' OR '))

		@json = list
	end

	def get_subbers
		@json = Scrape.select(:subber).distinct.order(subber: :asc)
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
