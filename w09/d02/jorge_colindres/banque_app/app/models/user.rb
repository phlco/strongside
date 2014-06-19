class User < ActiveRecord::Base
  has_secure_password
  has_many :account
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, :length => {:within => 8..16}
  attr_accessible :email, :name, :password, :password_confirmation


  def total_balance
    total_balance = 0
    self.account.each do |account|
     total_balance += account.balance
    end
    total_balance
  end

  def rich?
    self.total_balance > 100000 ? true : false
  end
end
