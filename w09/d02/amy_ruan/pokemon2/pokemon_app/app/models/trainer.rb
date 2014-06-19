class Trainer < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :name, :password, :password_confirmation
  validates :email, presence: true, uniqueness: true
  validates :password, :length => {:within => 6..40}
  has_many :monsters, dependent: :destroy
  # def initialize(options)
  #   @email = options[:email]
  #   @password = options[:password]
  #   @password_confirmation = options[:password_confirmation]
  # end
end
