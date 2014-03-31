class GroupController < ApplicationController

	def index

		@group = Group.find(params[:id])

	end

	def feed

		# Get the recent activities for the group
		activities = Group.find(params[:id]).activities.order(created_at: :desc)

		# Return as a JSON array of activities
		render :json => activities

	end

	def create

		if request.post?

			name = params[:name]
			identifier = params[:identifier]

			if not Group.find_by_identifier(identifier)

				group = Group.new(:name => name, :identifier => identifier)
				group.save

				redirect_to :action => 'add', :id => group.id

			end

		end

	end


	def modify



	end

	def add

		if request.post?

			# Get the current group
			@group = Group.find(params[:id])

			# Get the user and add them to the group
			user_id = params[:user]
			@group.users << User.find(user_id)

			# Save the new group
			@group.save

		end

	end

end
