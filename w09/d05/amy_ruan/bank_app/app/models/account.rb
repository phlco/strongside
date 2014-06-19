# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  balance    :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ActiveRecord::Base
  attr_accessible :balance, :name, :user_id
  has_many :transactions
  belongs_to :user
  after_initialize :set_default
  validates :name, presence: true

  def set_default
    if self.balance.nil?
      self.balance = 0.0
    end
  end
end
