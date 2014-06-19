class Student < ActiveRecord::Base
  attr_accessible :name, :email, :gender, :image_url
end