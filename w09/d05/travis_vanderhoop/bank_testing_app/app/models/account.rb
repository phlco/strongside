class Account < ActiveRecord::Base
  attr_accessible :balance, :type, :user_id
  belongs_to :user
end
