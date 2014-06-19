require 'spec_helper'

describe Account do
  before(:each) do
    @user = User.new
    @account = Account.new
  end

  it "should require a name" do
    @account.save
    expect(@account.errors).to have_key(:name)
  end

  describe "#balance" do
    it "should exist" do
      expect(@account).to respond_to(:balance)
    end

    # this is tripping me up because my brain ain't working
    it "should start at 0" do
      @account.balance
    end
  end

  describe "#deposit" do
    it "should exist"
    it "should take in a number and add that amount to the account"
  end

  describe "#withdraw" do
    it "should exist"
    it "should take in a number and deduct that amount from the account"
  end

  it "can't be overdrawn"

end
    # @user.update_attributes({name: "Bob", email: "bob@bob.com", password: "12345678"})
    # @user.save

