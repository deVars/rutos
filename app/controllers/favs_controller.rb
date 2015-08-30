class FavsController < ApplicationController
	def get
		@json = [] if session[:user].nil?
		@json = Fav.select(:id, :title, :subber, :resolution).where(user_id: session[:user_id])
	end
end
