class Trainer < ActiveRecord::Base
  has_secure_password
  has_many :pokemons
  validates :email, presence: true, uniqueness: true
  validates :password, :length => {:within => 6..40}
  validates :name, presence: true
  attr_accessible :email, :password, :password_confirmation, :name
  before_destroy :delete_pokemons

  private
  def delete_pokemons
    self.pokemons.destroy_all
  end
end
