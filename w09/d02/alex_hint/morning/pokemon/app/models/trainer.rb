class Trainer < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :name, :password, :password_confirmation
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, on: :create, length: {minimum: 6}
  validates :name, presence: true

  has_many :monsters, dependent: :destroy
end