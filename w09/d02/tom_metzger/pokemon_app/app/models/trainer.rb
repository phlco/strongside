class Trainer < ActiveRecord::Base
  # requires bcrypt gem in Gemfile
  has_secure_password

  attr_accessible :email, :name, :password, :password_confirmation

  validates :email, :name, presence: true
  validates :email, uniqueness: true
  validates :password, :length => {:within => 6..30}

  has_many :monsters

end
