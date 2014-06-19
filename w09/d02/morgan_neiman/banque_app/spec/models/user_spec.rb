require 'spec_helper'


describe User do

  it "requires a name, email and password" do
    user = User.new
    expect(user.save).to be_false
  end
  it "validates password length" do
    user = User.new
    user.name = "Morgan"
    user.email = "quackhouse@me.com"
    user.password = "blah"
    user.password_confirmation = "blah"
    expect(user.save).to be_false
  end
  it "validates uniqueness of name and email" do
    user = User.new
    user.name = "Morgan"
    user.email = "quackhouse@me.com"
    user.password = "ughhhhhhh"
    user.password_confirmation = "ughhhhhhh"
    user.save

    user2 = User.new
    user2.name = "Morgan"
    user2.email = "shit@whatever.com"
    user2.password = "123456789"
    user2.password_confirmation = "123456789"
    expect(user2.save).to be_false

    user3 = User.new
    user3.name = "whatever"
    user3.email = "quackhouse@me.com"
    user3.password = "123456789"
    user3.password_confirmation = "123456789"
    expect(user3.save).to be_false

  end

  it "can have more than one account" do
    user = User.new
    user.name = "new person"
    user.email = "stuff@me.com"
    user.password = "123456789"
    user.password_confirmation = "123456789"
    user.save

    a1 = Account.new
    a2 = Account.new
    user.accounts << a1
    user.accounts << a2

    expect(user.accounts).to match_array([a1, a2])
  end

  it "has a total balance method" do
    user = User.new
    user.name = "Morgan"
    user.email = "quackhouse@me.com"
    user.password = "ughhhhhhh"
    user.password_confirmation = "ughhhhhhh"
    user.save

    a1 = Account.new
    a2 = Account.new
    user.accounts << a1
    user.accounts << a2

    expect(user.total_balance).to eq(a1.balance + a2.balance)
  end
  it "has a method rich" do
        user = User.new
    user.name = "Morgan"
    user.email = "quackhouse@me.com"
    user.password = "ughhhhhhh"
    user.password_confirmation = "ughhhhhhh"
    user.save

    a1 = Account.new
    a2 = Account.new
    user.accounts << a1
    user.accounts << a2
    expect(user).not_to be_rich

    a1.balance = 50_000
    a2.balance = 51_000

    expect(user).to be_rich


  end

end
