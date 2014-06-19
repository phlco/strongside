require 'spec_helper'

describe User do
  before(:each) do
    @user = User.new
  end

  describe "#password_digest" do
    it "should exist" do
      @user.valid?
      expect(@user.errors).to have_key(:password_digest)
    end

    it "should be 8+ characters" do
      @user.password = "poop"
      @user.save
      expect(@user.errors).to have_key(:password)
    end

    it "should be no longer than 16 characters" do
      @user.password = "poopoopoopoopoopoo"
      @user.save
      expect(@user.errors).to have_key(:password)
    end
  end

  describe "#name" do
    it "should exist" do
      @user.valid?
      expect(@user.errors).to have_key(:name)
    end

    it "should be unique" do
      @user.name = "Yolanda"
      @user.email = "yolanda@yolanda.com"
      @user.password = "12345678"
      @user.save
      user2 = User.new
      user2.name = "Yolanda"
      user2.email = "poop@poop.com"
      user2.password = "12345678"
      user2.save
      expect(user2.errors).to have_key(:name)
    end
  end

  describe "#email" do
    it "should exist" do
      @user.save
      expect(@user.errors).to have_key(:email)
    end

    it "should be unique" do
     @user.name = "Yolanda"
     @user.email = "poop@poop.com"
     @user.password = "12345678"
     @user.save
     user2 = User.new
     user2.name = "John"
     user2.email = "poop@poop.com"
     user2.password = "12345678"
     user2.save
     expect(user2.errors).to have_key(:email)
   end
  end

  it "should be able to have more than one account" do
    @user.name = "Joe"
    @user.email = "joe@joe.com"
    @user.password = "12345678"
    @user.save
    @user.accounts.create({name: "checking", balance: 1500})
    @user.accounts.create({name: "savings", balance: 0})
    expect(@user.accounts).not_to raise_error
  end

  describe "#total_balance" do
    it "should exist" do
      expect(@user).to respond_to(:total_balance)
    end

    it "should return the total amount of money they have" do
      @user.name = "Joe"
      @user.email = "joe@joe.com"
      @user.password = "12345678"
      @user.save
      @user.accounts.create({name: "checking", balance: 1500})
      @user.accounts.create({name: "savings", balance: 100})
      expect(@user.total_balance).to eq(1600)
    end
  end

  describe "#rich?" do
    it "should exist" do
      expect(@user).to respond_to(:rich?)
    end

    it "should return 'true' if they have more than $100k in le banque" do
      @user.name = "Rick"
      @user.email = "rick@rick.com"
      @user.password = "12345678"
      @user.save
      @user.accounts.create({name: "checking", balance: 100001})
      expect(@user.rich?).to eq(true)
    end
  end

end
