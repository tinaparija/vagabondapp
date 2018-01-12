class PostController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@cities = @user.cities
	end
end
