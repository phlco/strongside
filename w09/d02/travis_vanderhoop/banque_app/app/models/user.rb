class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_many :accounts

  has_secure_password
  validates :password, :password_confirmation, :length => { in: 5..16 }

  validates :name, presence: :true
  validates :name, uniqueness: :true
  validates :email, presence: :true
  validates :email, uniqueness: true


  def total_balance
    total = 0
    self.accounts.each do |account|
      total += account.balance
    end
    total
  end

  def rich?
    if self.total_balance > 100000
      true
    else
      false
    end
  end

end
