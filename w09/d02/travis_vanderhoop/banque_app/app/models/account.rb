class Account < ActiveRecord::Base
  attr_accessible :balance, :name, :user
  belongs_to :user
  validates :name, presence: :true
  validates :balance, presence: :true

  def withdraw(amount)
    self.balance -= amount unless amount > self.balance
  end

  def deposit(amount)
    self.balance += amount
  end
end
