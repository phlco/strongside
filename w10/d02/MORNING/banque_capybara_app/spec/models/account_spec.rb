require 'spec_helper'

describe Account do
  describe ".new" do
    let(:account) { Account.create }
    it "has a starting balance of 0" do
      expect(account.balance).to eq(0)
    end
    it "belongs to a user" do
      expect(account).to respond_to(:user)
    end
  end
  describe "#withdraw" do
    let(:account) { Account.create(balance: 500) }
    it "removes money" do
      expect { account.withdraw(50, "rent") }.to change{ account.balance }.from(500).to(450)
    end
  end
  describe "#deposit" do
    let(:account) { Account.create(balance: 500) }
    it "deposits money" do
      expect { account.deposit(50) }.to change{ account.balance }.from(500).to(550)
    end
  end
end
