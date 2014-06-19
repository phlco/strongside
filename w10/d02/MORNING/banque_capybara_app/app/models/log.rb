class Log < ActiveRecord::Base
  attr_accessible :action, :amount, :memo, :account_id
  belongs_to :account

end
