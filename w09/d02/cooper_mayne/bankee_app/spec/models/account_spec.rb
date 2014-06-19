require 'spec_helper'

describe Account do

  context "when created" do
    before(:each) do
      @account = Account.new
    end

    it "must have a balance" do
      @account.valid?
      expect(@account.errors).to have_key(:balance)
    end

    it "must have an user" do
      #user = User.create(email: 'coopermayne@gmail.com', password: 'cooperas', password_confirmation: 'cooperas')
      @account.valid?
      expect(@account.errors).to include(:user)
    end

  end

  context "after created" do
    before(:each) do
      @account = Account.new(balance: 100)
    end

    it "#deposit deposits money" do
      @account.deposit(100)
      expect(@account.balance).to eq 200
    end

    it "#withdraw withdraws money" do
      @account.withdraw(50)
      expect(@account.balance).to eq 50
    end

    it "accounts can't be overdrawn" do
      @account.withdraw(150)
      expect(@account.balance).to eq 100
    end

  end
end
