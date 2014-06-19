class Zombie < ActiveRecord::Base
  attr_accessible :brains, :hungry, :name, :weapon

  validates :name, presence: true #this is the validation for the name
end
