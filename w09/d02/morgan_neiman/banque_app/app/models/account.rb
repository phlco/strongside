class Account < ActiveRecord::Base
  attr_accessible :balance, :name, :user_id
  validates_presence_of :name
  belongs_to :user
  after_initialize do
    self.balance = 0
  end

  def deposit(amt)
    amt > 0 ? self.balance += amt : false
  end
  def withdraw(amt)
    self.balance >= amt ? self.balance -= amt : self.balance = 0
  end
end
