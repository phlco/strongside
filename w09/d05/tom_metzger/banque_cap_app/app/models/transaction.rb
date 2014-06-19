class Transaction < ActiveRecord::Base
  attr_accessible :account_id, :amount, :from_acct, :to_acct, :type
end
