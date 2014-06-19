class Account < ActiveRecord::Base
  attr_accessible :balance, :name
  belongs_to :user
  validates_presence_of :name, :user_id
  def deposit(num)
    self.balance += num
    return self.balance
  end
  def withdraw(num)
    if self.balance > num
      self.balance -= num
      return self.balance
    else return "You don't have that much money in your account!"
    end
  end
end
