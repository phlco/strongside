class Student < ActiveRecord::Base
  attr_accessible :name, :email, :image_url, :github, :facebook, :twitter
end
