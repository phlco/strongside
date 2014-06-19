class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :name, :password, :password_confirmation

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, :length => {:within => 8..16}
end
