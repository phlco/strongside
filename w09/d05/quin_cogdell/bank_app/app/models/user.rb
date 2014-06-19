class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  has_secure_password
  has_many :accounts, dependent: :destroy

  validates :name, :email, presence: true
  validates :name, :email, uniqueness: true

end
