# == Schema Information
#
# Table name: transactions
#
#  id         :integer          not null, primary key
#  balance    :decimal(, )
#  user_id    :integer
#  account_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Transaction < ActiveRecord::Base
  attr_accessible :account_id, :balance, :user_id
  belongs_to :account
  validates :balance, presence: true
  validates :account_id, presence: true
  before_save :update_balance

  def update_balance
    if account
      self.account.balance += self.balance
      new_balance = self.account.balance
      account = Account.find(self.account_id)
      account.update_attribute(:balance,new_balance)
    end
  end
end
