class Group < ActiveRecord::Base

	# We attach activities to groups
	has_many :activities

	# Groups have many users, and users can belong to multiple groups
	has_and_belongs_to_many :users

end
