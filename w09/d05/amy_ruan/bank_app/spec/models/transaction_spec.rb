# == Schema Information
#
# Table name: transactions
#
#  id         :integer          not null, primary key
#  balance    :decimal(, )
#  user_id    :integer
#  account_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'
require 'ruby-debug'

describe Transaction do
  context "validations" do
    it { should respond_to(:balance) }
    it { should respond_to(:user_id) }
    it { should respond_to(:account_id) }

    it { should belong_to(:account) }

    it { should validate_presence_of(:balance) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:account_id)}
  end

  describe "update_balance" do
    it "updates the balance of accounts" do
      user = User.create(name: "Amy", email: "amy@gmail.com", password: "hello", password_confirmation: "hello")
      account = Account.create(name: "savings", balance: 0, user_id: user.id)
      transaction = Transaction.new(balance:20, account_id: account.id, user_id: user.id)
      debugger
      expect{transaction.save}.to change{account.balance}.by(20)
    end
  end
end
