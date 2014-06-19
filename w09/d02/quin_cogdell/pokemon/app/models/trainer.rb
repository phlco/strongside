class Trainer < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :name, :password, :password_confirmation
  validates :email, presence: true
  validates :password, length: { minimum: 6 }
  validates :email, uniqueness: true

  has_many :monsters, dependent: :destroy

end
