class User < ActiveRecord::Base
  attr_accessible :email, :name, :lat, :lng
end