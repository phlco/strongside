# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  password_digest :string(255)
#  user_name       :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :password_digest, :user_name, :password, :password_confirmation
  has_secure_password
  has_many :accounts
  has_many :transactions

  def total_balance
    balance = 0
    self.accounts.each do |acct|
      balance += acct.balance
    end
    return balance
  end
end
