class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
