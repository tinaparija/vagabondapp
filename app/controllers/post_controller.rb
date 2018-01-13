class PostController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@cities = @user.cities
	end

	def show
		post_id =params[:id]
		@post = Post.find_by(id: post_id)
		user_id = @post.user_id
		@user = User.find_by(id: user_id)
	end

	def create 
		if current_user.id === params[:post][:user_id]
			Post.create(city_id: params[:post][:city_id], user_id: params[:post][:user_id])
			redirect_to cities_path
		end
	end

end
