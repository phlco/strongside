class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  validates_presence_of :name, :email, :password_digest
  validates :password, :length => {:within => 8..16}
  validates :name, uniqueness: true
  validates :email, uniqueness: true
  has_many :accounts

  def total_balance
    sum = 0
    self.accounts.each do |account|
      sum += account.balance
    end
    return sum
  end
  def rich?
    self.total_balance > 100_000 ? true : false
  end
end
