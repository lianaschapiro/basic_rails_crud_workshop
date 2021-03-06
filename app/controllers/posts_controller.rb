class PostsController < ApplicationController

	def index
		@posts = Post.all
		@user = current_user
	end

	def show
		@post = Post.find(params[:id])
		@user = current_user
	end

	def new
		@post = Post.new
		@user = current_user
	end

	def create
		@user = current_user
		@post = Post.new(params[:post].merge(user_id: @user.id))
		if @post.save
			flash[:notice] = "Your thoughts are in the world now"
			redirect_to posts_path
		else
			flash[:notice] = "Unable to share your thought...try again?"
			redirect_to new_post_path
		end
	end

	def edit
		@user = current_user
		@post = Post.find(params[:id])
	end

	def update
		@user = current_user
		@post = Post.find(params[:id])
		@post.update(params[:post])
		@post.save
		flash[:notice] = "Thanks for editing"
		redirect_to posts_path
	end

	def destroy
		@user = current_user
		@post = Post.find(params[:id])
		if @post.destroy
			flash[:notice] = "Post destroyed"
		else
			flash[:notice] = "Unable to destoy post"		
		end
		redirect_to posts_path
	end

end
