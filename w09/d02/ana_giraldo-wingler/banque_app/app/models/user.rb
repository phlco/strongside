class User < ActiveRecord::Base
  has_secure_password
  has_many :accounts

  attr_accessible :email, :name, :password_digest, :password

  validates :password, :presence => true, :length => {:minimum => 8, :maximum => 16}

  validates :email, :presence => true, :uniqueness => true

  validates :name, :presence => true, :uniqueness => true

  def total_balance
    total = 0
    accounts.each do |account|
      total += account.balance
    end
    total
  end

  def rich?
    if total_balance >= 100000
      true
    else
      false
    end
  end

end
