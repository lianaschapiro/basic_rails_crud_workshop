class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post])
		if @post.save
			flash[:notice] = "Your thoughts are in the world now"
			redirect_to posts_path
		else
			flash[:notice] = "Unable to share your thought...try again?"
			redirect_to new_post_path
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(params[:post])
		@post.save
		flash[:notice] = "Thanks for editing"
		redirect_to posts_path
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
			flash[:notice] = "Post destroyed"
		else
			flash[:notice] = "Unable to destoy post"		
		end
		redirect_to posts_path
	end

end
