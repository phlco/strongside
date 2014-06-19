class User < ActiveRecord::Base
  attr_accessible :name, :age, :travel_class
end