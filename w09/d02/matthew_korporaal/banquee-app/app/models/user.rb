class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :name, :password, :password_confirmation

  has_many :accounts

  validates :name, presence: true
  validates :email, uniqueness: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :password, length: { in: 6..18 }

  def total_balance
    total = 0
    self.accounts.each do |x|
      total += x.balance
    end
    total
  end

  def rich?
    total_balance >= 100000 ? true : false
  end
end
