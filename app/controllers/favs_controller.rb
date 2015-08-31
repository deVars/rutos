class FavsController < ApplicationController
	def get
		if session[:user].nil?
			@json = [] 
		end

		current_user = User.find(session[:user_id])
		@json = current_user.favs.all
	end

	def set
		if params == nil || params[:favdata] == nil || session[:user_id] == nil
			@json = {success: false}

			return @json
		end

		current_user = User.find(session[:user_id])
		current_user.favs.all.destroy_all
		logger.debug("favs are destroyed: #{current_user.favs.all.size}")
		create_count = 0

		favs = JSON.parse(params[:favdata])
		favs.each do |fav|
			logger.debug(fav)
			current_user.favs.create(:title => fav['title'], :subber => fav['subber'], :resolution => fav['resolution'])
			create_count = create_count.next
		end

		@json = {success: true, count: create_count}
	end
end
