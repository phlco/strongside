class User < ActiveRecord::Base
  attr_accessible :name, :email, :latitude, :longitude
end
