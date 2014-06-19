class Cat < ActiveRecord::Base
  attr_accessible :name, :age, :tagline, :image, :score
end