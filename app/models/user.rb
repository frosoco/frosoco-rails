require 'bcrypt'

# The User is the base profile
class User < ActiveRecord::Base

  # A user can make many posts
  has_many :posts
  has_many :comments

  # Users can be in many groups and groups have many users
  has_and_belongs_to_many :groups

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Add the avatar image
  mount_uploader :avatar, AvatarUploader

  include BCrypt

  def full_name

  	return self.first_name + " " + self.last_name

  end

end