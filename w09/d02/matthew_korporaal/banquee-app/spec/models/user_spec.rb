require 'spec_helper'

describe User do
  context "initialize :User" do
    it "should not create account without name, email, password" do
      user = User.new
      expect(user).to_not be_valid
    end

    it "requires a unique name & unique email and a password" do
      user = User.new
      user.name = "matthew"
      user.password = "kickhash"
      user.password_confirmation = "kickhash"
      user.email = "matthew@korp.com"
      user.save
      expect(user).to be_valid
    end

    it "should have unique names and emails" do
      user1 = User.new
      user1.name = "matthew"
      user1.password = "kickhash"
      user1.password_confirmation = "kickhash"
      user1.email = "matthew@korp.com"
      user1.save
      expect(user1).to be_valid

      user2 = User.new
      user2.name = "matthew"
      user2.password = "kickhash"
      user2.password_confirmation = "kickhash"
      user2.email = "matthew@korp.com"
      expect(user2.save).to eq(false)
    end
    it "requires passwords to be 8 to 16 characters" do
      user1 = User.new
      user1.name = "matthew"
      user1.password = "kick"
      user1.password_confirmation = "kick"
      user1.email = "matthew@korp.com"
      expect(user1.save).to eq(false)

      user2 = User.new
      user2.name = "matthew"
      user2.password = "kickhash"
      user2.password_confirmation = "kickhash"
      user2.email = "matthew@korp.com"

      expect(user2.save).to eq(true)
    end

  end

  context ":User operations" do
    let(:user) {
      User.new({
        name: "Matt",
        password: "matthew",
        password_confirmation: "matthew",
        email: "matthew@korporaal.com"
        })
    }

    it "can have more than one Account" do
      a1 = Account.new
      a2 = Account.new
      user.accounts << a1 << a2
      user.save
      expect(user.accounts.size).to eq(2)
    end

    it "should have a method total_balance, that returns the -total amount of money they have" do
      user.save
      expect(user.total_balance).to eq(0)
    end

    it "should have a method rich?, that returns true if they have more than 100k" do
      user.save
      expect(user.rich?).to eq(false)
      a1 = Account.new({
        balance: 50000,
        name: "checking",
        })
      a2 = Account.new({
        balance: 50000,
        name: "savings",
        })
      a1.save
      a2.save
      user.accounts << a1 << a2
      user.save
      expect(user.rich?).to be_true
    end
  end
end



