require 'spec_helper'

describe User do

  context "prevent user creation against validations" do
    let(:user) do
      user = User.new
    end

    it "cannot create a user without a valid password and password confirmation" do
      user.valid?
      expect(user.errors).to have_key(:password_digest)
    end

    it "cannot create a user with a password less than 8 characters" do
      user.password = "1234567"
      user.password_confirmation = "1234567"
      user.save
      user.valid?
      expect(user.errors).to have_key(:password)
    end

    it "cannot create a user with a password greater than 16 characters" do
      user.password = "12345678901234567"
      user.password_confirmation = "12345678901234567"
      user.save
      user.valid?
      expect(user.errors).to have_key(:password)
    end

    it "cannot create a user without an email" do
      user.valid?
      expect(user.errors).to have_key(:email)
    end

    it "cannot create a user without a name" do
      user.valid?
      expect(user.errors).to have_key(:name)
    end

    it "cannot create a user if the name is not unique" do
      user.name = "Tom"
      user.email = "test@test.net"
      user.password = "12345678"
      user.password_confirmation = "12345678"
      user.save
      user2 = User.new
      user2.name = "Tom"
      user2.email = "test2@test.net"
      user2.password = "12345678"
      user2.password_confirmation = "12345678"
      expect(user2.save).to be_false
    end

    it "cannot create a user if the email is not unique" do
      user.name = "Tom"
      user.email = "test@test.net"
      user.password = "12345678"
      user.password_confirmation = "12345678"
      user.save
      user2 = User.new
      user2.name = "Jon"
      user2.email = "test@test.net"
      user2.password = "12345678"
      user2.password_confirmation = "12345678"
      expect(user2.save).to be_false
    end
  end

  describe "#accounts" do
    let(:user) do
      user = User.create(name: "Tom", email: "test@test.net", password: "12345678", password_confirmation: "12345678")
    end

    it "can have an account" do
      expect(user).to respond_to :account
    end

    it "can have many accounts" do
      user.account.create
      user.account.create
      expect(user.account.length).to eq(2)
    end
  end

  describe "#total_balance" do
    let(:user) do
      user = User.create(name: "Tom", email: "test@test.net", password: "12345678", password_confirmation: "12345678")
    end

    it "should have a total_balance" do
      expect(user).to respond_to :total_balance
    end

    it "should return the balance of all accounts" do
      user.account.create(balance: 10)
      user.account.create(balance: 10)
      expect(user.total_balance).to eq(20)
    end
  end

  describe "#rich?" do
    let(:user) do
      user = User.create(name: "Tom", email: "test@test.net", password: "12345678", password_confirmation: "12345678")
    end

    it "should know if it's rich or not" do
      expect(user).to respond_to :rich?
    end

    it "should be rich if its #total_balance is greater than 1000k" do
      user.account.create(balance: 100001)
      expect(user.rich?).to be_true
    end

    it "should not be rich if its #total_balance is less than or equal to 100k" do
      user.account.create(balance: 100000)
      expect(user.rich?).to be_false
    end
  end

end
