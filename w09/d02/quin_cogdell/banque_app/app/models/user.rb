class User < ActiveRecord::Base

  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  has_many :accounts


  validates :name, :email, presence: true
  validates :password, length: { in: 8..16 }
  validates :name, :email, uniqueness: true

end

