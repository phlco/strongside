class Student < ActiveRecord::Base
  attr_accessible :name, :email, :img_url, :github, :stypi, :mobile, :facebook, :twitter, :venmo, :dropbox_email, :linkedin
end
