class Account < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :balance, :user_id
  validates :name, presence: true

  def deposit(amount)
    self.balance += amount
  end

  def withdraw(amount)
    if self.balance >= amount
      self.balance -= amount
    else
      self.balance = 0.0
    end
  end
end
