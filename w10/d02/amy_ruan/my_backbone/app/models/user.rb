class User < ActiveRecord::Base
  attr_accessible :age, :firstname, :lastname
end
