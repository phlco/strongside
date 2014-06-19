class Account < ActiveRecord::Base
  attr_accessible :balance, :user_id, :name

  belongs_to :user
end
