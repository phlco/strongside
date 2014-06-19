require 'spec_helper'

describe Account do

    it "requires a name" do
      account = Account.new
      account.valid?
      expect(account.errors).to have_key(:name)
    end

    it "has an opening balance of 0.0" do
      account = Account.new
      expect(account.balance).to eq(0.0)
    end

    describe "#deposit" do
      let(:account) do
        account = Account.new
      end
      it "can take a deposit" do
        expect(account).to respond_to :deposit
      end

      it "will update it's balance when taking a deposit" do
        account.deposit(10)
        expect(account.balance).to eq(10)
      end
    end

    describe "#withdraw" do
      let(:account) do
        account = Account.new
      end
      it "can withdraw" do
        expect(account).to respond_to :withdraw
      end

      it "will update it's balance when withdrawing" do
        account.balance = 10
        account.withdraw(10)
        expect(account.balance).to eq(0)
      end
    end

    it "cannot overdraw" do
      account = Account.create(balance: 1)
      account.withdraw(2)
      expect(account.balance).to eq(0.0)
    end

    it "belongs to a user" do
      user = User.create(name: "Tom", email: "test@test.net", password: "12345678", password_confirmation: "12345678")
      account = user.account.create
      expect(account.user).to eq(user)
    end
end
