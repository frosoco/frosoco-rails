class PostController < ApplicationController

	def index

		# Get the correct post
		post = Post.includes(:user).find(params[:id])

		# Render the JSON of the post
		render :json => post, :include => :user

	end

	def update

		puts params

		# Get the post element
		post = Post.find(params[:id])

		# Change the items
		post.content = params[:content]

		# Save the post
		post.save

		# Say that everything is OK
		head :ok

	end

	def create

		# Create a new post
		post = Post.new(:content => params[:content], :group_id => params[:group_id])
		post.user = current_user
		post.save

		# Say that everything is OK
		render :json => post

	end

	def add

		# Get the current post
		post = Post.find(params[:id])

		# Create a new comment based on the parameters
		comment = Comment.new(:content => params[:content])
		comment.user = current_user
		comment.save

		# Add the comment to the post
		post.comments << comment

		# Render the comment response as JSON
		render :json => comment

	end

	def comments

		# Get all the comments 
		comments = Post.find(params[:id]).comments

		# Return as JSON
		render :json => comments

	end

end
