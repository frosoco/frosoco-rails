class PostController < ApplicationController

	def create

		# Create and save the post
		post = Post.new(:content => params[:content])
		post.user = current_user
		post.save

		# Then add it to the news feed
		activity = Activity.new(:content_type => 'post', :content_id => post.id).save

		# Render a response as JSON
		# render :json => post

		# Redirect to the feed
		redirect_to :controller => 'user', :action => 'feed'

	end

end
