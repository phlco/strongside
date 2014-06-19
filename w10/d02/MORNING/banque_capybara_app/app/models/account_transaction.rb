class AccountTransaction < ActiveRecord::Base
  attr_accessible :action, :amount, :to_account, :account_id, :memo
  belongs_to :account
end
