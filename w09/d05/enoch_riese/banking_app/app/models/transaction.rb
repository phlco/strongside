# == Schema Information
#
# Table name: transactions
#
#  id         :integer          not null, primary key
#  date       :date
#  type       :string(255)
#  amount     :integer
#  memo       :string(255)
#  account_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Transaction < ActiveRecord::Base
  attr_accessible :amount, :date, :memo, :trans_type, :account_id
  belongs_to :account
end
