class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :name, :password, :password_confirmation, :account_id
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password, :length => {:within => 8..16}
  has_many :accounts

  def total_balance
    balance = 0
    self.accounts.each do |t|
      balance += t.balance
    end
    return balance
  end

  def rich?
    self.total_balance > 100000
  end
end
