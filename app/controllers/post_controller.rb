class PostController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@cities = @user.cities
	end

	def create 
		if current_user.id === params[:post][:user_id]
			Post.create(city_id: params[:post][:city_id], user_id: params[:post][:user_id])
			redirect_to cities_path
		
	end

end
