class Student < ActiveRecord::Base
  attr_accessible :email, :image_url, :name
end
