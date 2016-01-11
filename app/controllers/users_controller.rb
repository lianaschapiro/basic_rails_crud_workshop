class UsersController < ApplicationController
	def index
		@users = User.all
		@posts = Post.all
	end

	def show
		@user = current_user
		@posts = @user.posts
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
  			flash[:notice] = "New user created successfully."
  			redirect_to @user
  		else
  			flash[:notice] = "Unable to create new user"
  			redirect_to new_user_path
  		end
  	end
		

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		@user.update(params[:user])
		@user.save
		redirect_to @user
	end

	def destroy
		@user = current_user
		if @user.destroy
			flash[:notice] = "This user was deleted"
		else
			flash[:notice] = "Unable to delete the user"
		end
		redirect_to users_path
	end

end
