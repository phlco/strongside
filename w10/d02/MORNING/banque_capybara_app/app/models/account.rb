class Account < ActiveRecord::Base
  attr_accessible :balance, :name, :user_id
  belongs_to :user
  has_many :account_transactions


  def deposit(amount, memo = nil)
    self.balance += amount
    self.save
    self.account_transactions.create(amount: amount, action: 'deposit', memo: memo)
  end

  def withdraw(amount, memo)
    self.balance -= amount
    self.save
    self.account_transactions.create(amount: amount, action: 'withdraw', memo: memo)
  end

end
