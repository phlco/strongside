class Transfer < ActiveRecord::Base
  attr_accessible :account_id, :amount, :kind
  belongs_to :account

  validates_presence_of :account_id, :amount, :kind
end
