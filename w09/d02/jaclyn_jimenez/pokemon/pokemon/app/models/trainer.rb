class Trainer < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :name, :password, :password_confirmation
  has_many :pocketmonsters, dependent: :destroy

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: {:within => 6..20}
  validates :name, presence: true
end
