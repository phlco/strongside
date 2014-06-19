class Account < ActiveRecord::Base
  attr_accessible :balance, :name, :user_id

  belongs_to :user

  validates :name, presence: true
  validates :balance, presence: true

  def withdraw(amount)
    if amount < balance
      self.balance -= amount
    else
      "cannot withdraw"
    end
  end
  def deposit(amount)
    self.balance += amount
  end
end
