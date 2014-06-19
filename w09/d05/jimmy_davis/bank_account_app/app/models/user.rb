class User < ActiveRecord::Base
  attr_accessible :password, :password_confirmation, :username

  has_many :accounts, dependent: :destroy

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, :password_confirmation, :length => { in: 8..16 }

  def total_balance
    balance = 0
    accounts = Account.where(user_id: self.id)
    accounts.each { |account| balance += account.balance }
    balance
  end

  def transaction_history

  end

end
