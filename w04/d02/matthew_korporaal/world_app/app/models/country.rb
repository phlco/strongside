class Country < ActiveRecord::Base
  attr_accessible :name

  has_many :states
end