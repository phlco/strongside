class BankAccount < ActiveRecord::Base
  attr_accessible :name, :balance
  belongs_to :user
  validates :name, uniqueness: true, presence: true
  validates :balance, presence: true

  def make_deposit(deposit_amount)
    self.balance += deposit_amount
  end
end
