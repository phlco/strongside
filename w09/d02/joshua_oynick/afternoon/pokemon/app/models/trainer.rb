class Trainer < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :name, :password, :password_confirmation
  has_many :monsters, dependent: :destroy
  validates :email, presence: true
  validates :email, uniqueness: true
end
