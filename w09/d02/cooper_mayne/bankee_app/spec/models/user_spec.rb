require 'spec_helper'

describe User do
  it "cannoted create a user without a password and password_confirmation and email" do
    user = User.new
    expect(user).to_not be_valid
  end

  it "cannot create a user without a valid email" do
    user = User.new
    user.password = '32323232'
    user.password_confirmation = '32323232'
    expect(user).to_not be_valid
  end

  it "can create a user with a valid password and password confirmation" do
    user = User.new
    user.email = "coopermayne@gmail.com"
    expect(user).to_not be_valid
  end

  it "will not let me create users with the same email" do
    user1 = User.new
    user1.email = "cooper@gmail.com"
    user1.password = "32323232"
    user1.password_confirmation = "32323232"
    user1.save

    user2 = User.new
    user2.email = "cooper@gmail.com"
    user2.password = "32323232"
    user2.password_confirmation = "32323232"

    expect(user2).to_not be_valid
  end

  it "will ensure my password is at least 8 charachters" do
    user = User.new
    user.email = "cooper@gmail.com"
    user.password = "3232"
    user.password_confirmation = "3232"
    expect(user).to_not be_valid
  end

  it "will ensure my password is at most 16 charachters" do
    user = User.new
    user.email = "cooper@gmail.com"
    user.password = "aaaaaaaaaaaaaaaaa"
    user.password_confirmation = "aaaaaaaaaaaaaaaaa"
    expect(user).to_not be_valid
  end

  it "should have a valid email address" do
    user = User.new
    user.email = "cooper"
    user.password = "32323232"
    user.password_confirmation = "32323232"
    expect(user).to_not be_valid
  end

  it "should have a valid email address" do
    user = User.new
    user.email = "@com.com"
    user.password = "32323232"
    user.password_confirmation = "32323232"
    expect(user).to_not be_valid
  end

  it "should have a valid email address" do
    user = User.new
    user.email = "com.com"
    user.password = "32323232"
    user.password_confirmation = "32323232"
    expect(user).to_not be_valid
  end

  it "should have a valid email address" do
    user = User.new
    user.email = "a@com"
    user.password = "32323232"
    user.password_confirmation = "32323232"
    expect(user).to_not be_valid
  end

  context "after creation" do
    before(:each) do
      @user = User.new
      @user.email = "cooper@gmail.com"
      @user.password = "32323232"
      @user.password_confirmation = "32323232"
      @user.save

      a1 = Account.new(balance: 100)
      a2 = Account.new(balance: 200)

      @user.accounts << a1 << a2
    end

    it "can have many accounts" do
      expect(@user.accounts.count).to eq 2
    end

    it '#total_balance gives the total balance' do
      expect(@user.total_balance).to eq 300
    end

    it "#rich check if he has more than 100k" do
      expect(@user).to_not be_rich
    end

    it "#rich check if he has more than 100k" do
      
      a3 = Account.new(balance: 100000)
      @user.accounts << a3
      expect(@user).to be_rich
    end
  end

end
