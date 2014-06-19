require 'spec_helper'

describe Account do
  context "validation" do
    it "has a name error if name is not set" do
      account = Account.new
      account.valid?
      expect(account.errors).to have_key(:name)
    end
    it "has no name error if name is set" do
       account = Account.new(name: "savings")
      account.valid?
      expect(account.errors).to_not have_key(:name)
    end

    it "has a balance error if balance is not set" do
      account = Account.new
      account.valid?
      expect(account.errors).to have_key(:balance)
    end

    it "has no balance error if balance is set" do
      account = Account.new(balance: 1000)
      account.valid?
      expect(account.errors).to_not have_key(:balance)
    end

    it "belongs to a user" do
      user1 = User.create(email: "anda@gmail.com", name:"anda", password: "123456789", password_confirmation: "123456789")
      account = Account.new(name: "savings", balance:1000)
      account.user = user1
      account.save
      expect(account.user_id).to eq(user1.id)
    end
  end

  let(:account){
    Account.create({
      name: "savings",
      balance: 1000
    })
  }

  describe "deposit method" do
    it "is able to increase balance when it deposits money" do
      account.deposit(1000)
      expect(account.balance).to eq(2000)
    end
  end

  describe "withdrawal method" do
    it "is able to decrease balance when it withdraws money" do
      account.withdraw(800)
      expect(account.balance).to eq(200)
    end
    it "is not able to go below zero in balance when it withdraws" do
      account.withdraw(1100)
      expect(account.balance).to eq (0)
    end
  end

end
