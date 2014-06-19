class Account < ActiveRecord::Base
  belongs_to :user
  attr_accessible :balance 

  validates :balance, presence: true
  validates :user, presence: true

  def deposit money
    self.balance += money
  end

  def withdraw money
    self.balance -= money unless self.balance < money
  end

end
