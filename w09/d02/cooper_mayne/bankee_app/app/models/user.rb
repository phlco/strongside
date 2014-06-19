class User < ActiveRecord::Base
  has_secure_password
  has_many :accounts
  attr_accessible :email, :name, :password_digest

  validates :email, presence: true, uniqueness: true,
      format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :password, length: { minimum: 8, maximum: 16 }

  def total_balance
    total = 0
    self.accounts.each do |account|
      total += account.balance
    end  
    total
  end

  def rich?
    self.total_balance >= 100000
  end

end
