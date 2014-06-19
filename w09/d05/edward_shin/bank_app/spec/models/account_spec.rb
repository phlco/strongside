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

require 'spec_helper'

describe Account do
  context "when an account is created" do
    let(:account){Account.new}
    it "returns an error without a name" do
      account.valid?
      expect(account.errors).to have_key(:name)
    end

    it "returns error without user_id" do
      account.valid?
      expect(account.errors).to have_key(:user_id)
    end

    it "has a default balance of 0" do
      expect(account.balance).to eq(0)
    end
  end

  context "when user accesses the account" do
    let(:user) {User.new(email: "eddie@shin", password: "kickhash", password_confirmation: "kickhash")}
    let(:account) {Account.new(name: "checking", user_id: user.id)}

    it "has method deposit that adds money" do
      account.balance = 500.00
      account.deposit(100)
      expect(account.balance).to eq(600)
    end

    it "has a method that withdraws money" do
      account.balance = 500
      account.withdraw(100)
      expect(account.balance).to eq(400)
    end

    it "does not allow user to overdraw from account" do
      account.balance = 500
      expect(account.withdraw(501)).to eq("You do not have the appropriate funds")
    end

  end
end
