# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  balance    :float            default(0.0)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ActiveRecord::Base
  attr_accessible :balance, :name, :user_id
  belongs_to :user

  after_initialize :set_defaults
  validates :user_id, presence: true
  validates :name, presence: true

  def set_defaults
    if self.balance.nil?
      self.balance = 0
    end
  end

  def deposit(amount)
    self.balance += amount
  end

  def withdraw(amount)
    if balance >= amount
      self.balance -= amount
    else
      "You do not have the appropriate funds"
    end
  end
end
