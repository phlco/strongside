class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_many :accounts, :order => 'created_at DESC'

  has_secure_password

  validates :password,              length: { in: 8..16 },
                                    confirmation: true
  validates :email,                 uniqueness: true,
                                    presence: true
  validates :password_confirmation, presence: true


  def transfer(amount, from_account, to_account, memo)
    from_account.withdraw(amount, memo)
    to_account.deposit(amount, memo)
  end

  def total_balance
    self.accounts.map(&:balance).inject(:+)
  end

end
