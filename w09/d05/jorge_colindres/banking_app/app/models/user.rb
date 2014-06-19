class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  validates :email, uniqueness: true, presence: true
  validates :password, :password_confirmation, :length => { in: 6..20 }
  has_secure_password
  has_many :bank_accounts

  def get_total_balance
    total_balance = 0
    self.bank_accounts.each do |account|
      total_balance += account.balance
    end
    total_balance
  end
end
