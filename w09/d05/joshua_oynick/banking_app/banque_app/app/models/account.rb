# == Schema Information
#
# Table name: accounts
#
#  id           :integer          not null, primary key
#  amount       :decimal(, )
#  user_id      :integer
#  account_type :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Account < ActiveRecord::Base
end
