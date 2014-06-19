class Account < ActiveRecord::Base
  attr_accessible :balance, :name, :user_id

  belongs_to :user

  validates :name, presence: true
  validates :balance, presence: true

  def deposit(amount)
    self.balance += amount
  end

  def withdraw(amount)
    self.balance -= amount
  end

end
