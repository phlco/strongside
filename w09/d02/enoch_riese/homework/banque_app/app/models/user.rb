class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest
  attr_accessible :password
  has_secure_password
  validates_presence_of :email, :name, :password
  validates_uniqueness_of :name, :email
  validates :password, length: {minimum: 8, maximum: 16}
  has_many :accounts

  def total_balance
    all_balances = self.accounts.map {|acct| acct.balance}
    balance = 0
    all_balances.each {|acct| balance += acct}
    return balance
  end
  def rich?
    self.total_balance > 100000
  end
end
