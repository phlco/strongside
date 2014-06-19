class Trainer < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :name, :password_digest, 
                :password, :password_confirmation
  has_many :pokemons, :dependent => :destroy

  validates :email, presence: true, uniqueness: true,
      format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  #validates :password, length: { minimum: 6 }
end
