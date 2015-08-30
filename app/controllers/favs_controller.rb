class FavsController < ApplicationController
	def get
		if session[:user].nil?
			@json = [] 
		end
		@json = Fav.select(:id, :title, :subber, :resolution).where(user_id: session[:user_id])
	end
end
