class Trainer < ActiveRecord::Base
  has_secure_password
  has_many :monsters, dependent: :destroy
  attr_accessible :email, :name, :password, :password_confirmation
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, :password_confirmation, :length => { in: 6..20 }
end
