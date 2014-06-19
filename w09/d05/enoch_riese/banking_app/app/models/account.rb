# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  balance    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ActiveRecord::Base
  attr_accessible :balance, :name
  belongs_to :user
  has_many :transactions
  def withdraw(amount)
    self.balance -= amount
    self.save
  end
  def deposit(amount)
    self.balance += amount
    self.save
  end
end
