class User < ActiveRecord::Base
  has_secure_password
  has_many :account  #Users can have more than one Account

  attr_accessible :email, :name, :password, :password_confirmation #A user requires a name, email and password.
  validates :name, presence: true  #User names must be present.
  validates :name, uniqueness: true  #User names must be unique
 validates :email, presence: true  #User names and emails must be unique.
  validates :email, uniqueness: true  #User names and emails must be unique.
  validates :email, :length => {:within => 8..16}   #Passwords must be 8 to 16 characters in length.
end