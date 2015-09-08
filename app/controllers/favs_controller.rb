class FavsController < ApplicationController
	SUCCESS_FALSE = {success: false}
	SUCCESS_TRUE = {success: true}

	def get
		@json = []

		begin
			do_session_check
		rescue StandardError => error
			logger.error error.message
			return @json
		end

		current_user = User.find session[:user_id]
		@json = current_user.favs.all
	end

	def add
		@json = SUCCESS_FALSE

		begin
			do_session_check
			do_fav_data_check
		rescue StandardError => error
			logger.error error.message
			return @json
		end

		return @json unless params[:fav_data].respond_to? :to_s
		
		fav = params[:favdata]
		return @json if fav['title'] == nil

		effective_subber = '*'
		effective_subber = fav['subber'] unless fav['subber'].nil?

		effective_resolution = 720
		effective_resolution = fav['resolution'] unless fav['resolution'].nil?

		current_user = User.find session[:user_id]
		current_user.favs.create(:title => fav['title'], \
			:subber => effective_subber, \
			:resolution => effective_resolution)
		@json = SUCCESS_TRUE
	end

	def remove
		@json = SUCCESS_FALSE
		begin
			do_session_check
			do_fav_data_check
		rescue StandardError => error
			logger.error error.message
			return
		end

		fav = params[:favdata]
		return @json unless fav['id'] != nil && 
			fav['id'].respond_to?(:to_i) && 
			fav['id'].to_i != 0

		logger.debug fav['id']

		current_user = User.find session[:user_id]
		current_user.favs.where(:id => fav['id'].to_i).destroy_all
		@json = SUCCESS_TRUE
	end

	def set
		@json = SUCCESS_FALSE

		begin
			do_session_check
			do_fav_data_check
		rescue StandardError => error
			logger.error error.message
			return @json
		end

		current_user = User.find session[:user_id]
		current_user.favs.all.destroy_all
		logger.debug("favs are destroyed: #{current_user.favs.all.size}")
		create_count = 0

		favs = JSON.parse params[:favdata]
		favs.each do |fav|
			logger.debug(fav)
			current_user.favs.create(:title => fav['title'], \
				:subber => fav['subber'], \
				:resolution => fav['resolution'])
			create_count = create_count.next
		end

		@json = {success: true, count: create_count}
	end

	def do_session_check
		if session[:user_id].nil?
			raise 'no session running'
		end
	end

	def do_fav_data_check
		if params == nil || params[:favdata] == nil
			@json = SUCCESS_FALSE
			raise ArgumentError.new('missing favdata')
		end
	end

	private :do_session_check, :do_fav_data_check

end
