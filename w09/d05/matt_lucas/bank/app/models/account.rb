# == Schema Information
#
# Table name: accounts
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  balance     :float
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Account < ActiveRecord::Base
  belongs_to :customer
  attr_accessible :name, :balance, :amount, :customer_id
  has_paper_trail :meta => { :balance => :balance }
end
