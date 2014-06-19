class Account < ActiveRecord::Base
  attr_accessible :balance, :name

  belongs_to :users
end
