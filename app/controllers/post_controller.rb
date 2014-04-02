class PostController < ApplicationController

	def index

		# Get the correct post
		post = Post.find(params[:id])

		# Now construct a response from the contents of the post
		response = {}
		response['id'] = post.id
		response['name'] = post.user.full_name
		response['avatar'] = post.user.avatar.url
		response['content'] = post.content
		response['timestamp'] = post.created_at

		# Render the JSON of the post
		render :json => response

	end

	def create

		# Get the corresponding group
		group = Group.find(params[:group])

		# Create and save the post
		post = Post.new(:content => params[:content])
		post.user = current_user
		post.save

		# Then add it to the news feed
		activity = Activity.new(:content_type => 'post', :content_id => post.id, :group_id => group.id)
		activity.save

		# Render a response as JSON
		render :json => activity

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

end
