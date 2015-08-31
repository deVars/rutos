class UsersController < ApplicationController
	require 'digest'

	def new
	end

	def signin
		if (session[:user_id] == nil) 
			user = User.find_by_password(params[:password])
			digested_user = Digest::SHA512.base64digest params[:username]
			logger.info user
			if user != nil && user.name == digested_user
				session[:user_id] = user.id
				@json = {success: true, user_id: user.id}
			end
		else
			@json = {success: true, user_id: session[:userId]}
		end
	end
end
