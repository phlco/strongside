class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  has_many :accounts
  has_many :transfers, through: :accounts
end
