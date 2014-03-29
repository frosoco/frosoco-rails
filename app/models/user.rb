require 'bcrypt'

# The User is the base profile
class User < ActiveRecord::Base

  has_many :posts
  has_and_belongs_to_many :activities

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