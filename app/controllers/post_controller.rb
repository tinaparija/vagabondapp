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

	def edit 
        post_id = params[:id]
        @post = Post.find_by(id: post_id)
    end 

    def update 
        post_id = params[:id]
        @post = Post.find_by(id: post_id)
        if @post.update(post_params)
            redirect_to show_post_path(@post)
        else 
            @post_id = params[:id]
            @post = Post.find_by(id: post_id)
        end 
    end
    
	def new 
		@post = Post.new 
		city_id = params[:city_id]
		@city = City.find_by(id: city_id)
	end

	def create 
		if current_user.id === params[:post][:user_id]
			city = City.find(params[:city_id])
			new_post = Post.new(post_params)
			if  new_post.save
				City.posts << new_post 
				redirect_to city_path 
			else
			end 
				
		end
	end

	def destroy
		post_id = params[:id]
		post = Post.find_by(id: post_id)
		post.delete
		
		user_id = params[:user_id]
		user = User.find_by(id: user_id)
		redirect_to cities_path
	end

	def post_params
		params.require(:post).permit(:title, :content)
	end

end
