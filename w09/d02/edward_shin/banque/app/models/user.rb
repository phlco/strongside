class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :name, :password, :password_confirmation

  has_many :accounts

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true,uniqueness: true
  validates :password, presence: true, on: :create, length: {in: 8..16}

  def total_balance
    balance = 0
    self.accounts.each do |account|
      balance = balance + account.balance
    end
    return balance
  end

  def is_rich?
    if self.total_balance >= 100000
      true
    else
      false
    end
  end
end
