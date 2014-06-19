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

require 'spec_helper'

describe Account do
  context "validation" do
    before(:each) {@user = User.create(name: "Amy", email: "anda@gmail.com", password: "hello", password_confirmation: "hello")}
    before(:each) {@account = Account.new(name: "savings", user_id: @user.id)}

    subject{@account}

    it {should respond_to(:balance)}
    it {should respond_to(:name)}

    it {should have_many(:transactions)}
    it {should belong_to(:user)}

    it "has a starting balance of 0 " do
      expect(@account.balance).to eq(0.0)
    end

    it "can be created with a name" do
      @account.name = "Savings"
      expect(@account.save).to be_true
    end

  end
end
