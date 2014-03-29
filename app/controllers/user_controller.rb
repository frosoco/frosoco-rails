class UserController < ApplicationController

	def login

		# If this is a POST request, process through here
		if request.post?

			# Get login parameters
			email = params[:email]
			password = params[:password]

			# Retrieve the user
			user = User.find_by_email(email)

			# If the password is valid
			if user and user.valid_password?(password)

				# Save the user to our session
				sign_in user

				# Show the feed
				redirect_to action: 'feed'

			else

				# Show an error for the flash
				flash.now[:error] = 'Incorrect user name or password'

			end

		# Proceed to load the login page

		end

	end

	def logout

		# Clear the session
		sign_out current_user

		# Return to the login screen
		redirect_to action: 'login'

	end

	def register

		# If this is a POST request, process through here
		if request.post?

			# Get POST parameters
			email = params[:email]
			password = params[:password]

			# Check that the email is not registered yet
			user = User.find_by_email(email)

			# If the email exists, it's registered
			if user

				flash.now[:error] = 'That email is already registered.'

			else

				user = User.new(:email => email, :password => password, :first_name => '', :last_name => '')
				user.save

				flash.now[:notice] = 'Registration successful, log in now.'

				redirect_to action: 'login'

			end

		end

	end


	def profile

		if not signed_in?

			redirect_to action: 'login'

		end

		# If this is a POST request, process through here
		if request.post?

			current_user.first_name = params[:first_name]
			current_user.last_name = params[:last_name]
			current_user.email = params[:email]
			if params[:password] == params[:confirm_password]
				current_user.password = params[:password]
			end
			if params[:avatar]
				current_user.avatar = params[:avatar]
			end
			current_user.save(validate: false)

		end

	end

	def show

		@user = User.find(params[:id])

	end

	def feed

		@activities = Activity.all.order(created_at: :desc)

		@users = User.all

	end

end