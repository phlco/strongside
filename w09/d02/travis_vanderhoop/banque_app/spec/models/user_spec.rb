require 'spec_helper'

describe User do

  let(:user) do
    User.new
  end

  it "won't be saved if the password and password confirmation don't match" do
    user.name = "Bruce Wayne"
    user.email = "vanderhoop@me.com"
    user.password = "batman"
    user.password_confirmation = "marp"
    expect(user).to_not be_valid
  end

  it "will be saved if the password and password confirmation do match" do
    user.name = "Bruce Wayne"
    user.email = "vanderhoop@me.com"
    user.password = "batman"
    user.password_confirmation = "batman"
    expect(user).to be_valid
  end

  it "will not save if the user doesn't provide a name" do
    user.email = "vanderhoop@me.com"
    user.password = "batman"
    user.password_confirmation = "batman"
    # need to run .valid? for user to have an errors hash
    user.valid?
    expect(user.errors).to have_key(:name)
  end

  it "will not save if the user doesn't provide an email" do
    user.password = "batman"
    user.password_confirmation = "batman"
    user.name = "Bruce Wayne"
    user.valid?
    expect(user.errors).to have_key(:email)
  end

  it "will not save a user where email matches an email in the database" do
    user.password = "batman"
    user.password_confirmation = "batman"
    user.name = "Bruce Wayne"
    user.email = "vanderhoop@me.com"
    user.save
    # IMPORTANT: You need to save the user to the database for uniqueness validations
    # to have any effect
    expect(user).to be_valid

    user2 = User.new
    user2.password = "yourmomisyourmom"
    user2.password_confirmation = "yourmomisyourmom"
    user2.name = "David Blaine"
    user2.email = "vanderhoop@me.com"

    user2.valid?
    expect(user2.errors).to have_key(:email)
  end

  it "will not save where password inputs are below 5 or above 16 characters" do
    user.password = "marp"
    user.password_confirmation = "marp"
    user.name = "Bruce Wayne"
    user.email = "vanderhoop@me.com"
    user.valid?
    expect(user.errors).to have_key(:password)

    user2 = User.new
    user2.password = "yourmomisyourmomisyourmomisyourmom"
    user2.password_confirmation = "yourmomisyourmomisyourmomisyourmom"
    user2.name = "David Blaine"
    user2.email = "vanderhoop@me.com"
    user2.valid?
    expect(user2.errors).to have_key(:password)
  end

  it "will not save a user where the name matches a name already in the db" do
    user.password = "marped"
    user.password_confirmation = "marped"
    user.name = "Bruce Wayne"
    user.email = "vanderhoop@me.com"
    # IMPORTANT: You need to save the user to the database for uniqueness validations
    # to have any effect
    user.save

    user2 = User.new
    user2.password = "batman"
    user2.password_confirmation = "batman"
    user2.name = "Bruce Wayne"
    user2.email = "marp@darp.com"
    user2.valid?
    expect(user2.errors).to have_key(:name)
  end

  it "will save a user where email, name, and password meets criteria" do
    user.name = "Travis"
    user.password = "batman"
    user.password_confirmation = "batman"
    user.email = "travisvanderhoop@gmail.com"
    expect(user.save).to eq(true)
  end

  context 'when user has been created' do
    before(:each) do
      user.name = "Travis"
      user.password = "batman"
      user.password_confirmation = "batman"
      user.email = "travisvanderhoop@gmail.com"
      user.save
    end

    it "can have multiple accounts" do
      account1 = Account.new
      user.accounts << account1
      expect(user.accounts.length).to eq(1)
      account2 = Account.new
      user.accounts << account2
      expect(user.accounts.length).to eq(2)
    end

    it "can retrieve its total balance across all accounts" do
      account1 = Account.new
      account1.balance = 2500
      user.accounts << account1
      account2 = Account.new
      account2.balance = 2500
      user.accounts << account2
      expect(user.total_balance).to eq(5000)
    end

    it "can ascertain whether or not it's rich" do
      account1 = Account.new
      account1.balance = 2500
      user.accounts << account1

      account2 = Account.new
      account2.balance = 2500
      user.accounts << account2

      expect(user.rich?).to eq(false)

      account3 = Account.new
      account3.balance = 2500000
      user.accounts << account3
      expect(user.rich?).to eq(true)

    end

  end # context: when user has been created





end
