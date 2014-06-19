class Account < ActiveRecord::Base
  attr_accessible :balance, :name, :user_id
  belongs_to :user
  validates :name, presence: true
  validates :balance, presence: true

  def deposit(amount)
    self.balance += amount
  end

  def withdraw(amount)
    if amount < self.balance
      self.balance -= amount
    else
      amount = self.balance
      self.balance = 0
      puts "You can only withdraw #{amount}"
    end
  end
end
