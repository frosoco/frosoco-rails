class Group < ActiveRecord::Base

	# They also have many posts
	has_many :posts

	# Groups have many users, and users can belong to multiple groups
	has_and_belongs_to_many :users

end
