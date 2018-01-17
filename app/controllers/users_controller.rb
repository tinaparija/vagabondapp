class UsersController < ApplicationController
	def index 
		@users = User.all
	end 

	def new 
		@user = User.new
	end 

	def create
		if user_params[:password].length >= 6
			@user = User.create(user_params)
			login (@user)
			redirect_to @user
		else
			flash[:notice] = "minimum password length 6 characters"
			redirect_to new_user_path
		end
	end 

	def show
		@user = User.find_by_id(params[:id])
	end 

	def edit 
		user_id = params[:id]
		@user = User.find_by(id: user_id)
	end 

	def update 
		user_id = params[:id]
		@user = User.find_by(id: user_id)
		if @user.update(user_params)
			redirect_to user_path(@user)
		else 
			@user_id = params[:id]
			@user = User.find_by(id: user_id)
		end 
	end 

	def destroy
	    user_id = params[:id]
	    user = User.find_by(id: user_id)
	    user.destroy
	    redirect_to users_path
    end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :home_city, :email, :password, :image)
	end 
end
