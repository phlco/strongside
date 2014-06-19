require 'spec_helper'

describe User do
  it "validates presence of name" do
    user = User.new({email: "email", password: "password"})
    user.valid?
    expect(user.errors).to have_key(:name)
  end
  it "validates presence of email" do
    user = User.new({name: "name", password: "password"})
    user.valid?
    expect(user.errors).to have_key(:email)
  end
  it "validates presence of password" do
    user = User.new({name: "name", email: "email"})
    user.valid?
    expect(user.errors).to have_key(:password)
  end
  it "validates that password has more than 8 characters" do
    user = User.new({name: "name", email: "email", password: "pass"})
    user.valid?
    expect(user.errors).to have_key(:password)
  end
  it "validates that password has fewer than 16 characters" do
    user = User.new({name: "name", email: "email", password: "123456789012345678"})
    user.valid?
    expect(user.errors).to have_key(:password)
  end
  it "validates uniqueness of email" do
    user = User.create({name: "name", email: "email", password: "password"})
    user2 = User.new({name: "name2", email: "email", password: "password"})
    user2.valid?
    expect(user2.errors).to have_key(:email)
  end
  it "validates uniqueness of name" do
    user = User.create({name: "name3", email: "email2", password: "password"})
    user2 = User.new({name: "name3", email: "email2", password: "password"})
    user2.valid?
    expect(user2.errors).to have_key(:name)
  end
  it "can have more than one account" do
    user = User.create({name: "name3", email: "email2", password: "password"})
    user.accounts.create({balance: 300000, name: "Savings"})
    account = user.accounts.create({balance: 1000, name: "Checking"})
    expect(user.accounts.length).to eq(2)
  end
  it "has total_balance that says how much money there is" do
    user = User.create({name: "name4", email: "email3", password: "password"})
    user.accounts.create({balance: 300000, name: "Savings"})
    account = user.accounts.create({balance: 1000, name: "Checking"})
    expect(user.total_balance).to eq(301000)
  end
  it "has a method rich? that says if they have more than 100k" do
    user = User.create({name: "name4", email: "email3", password: "password"})
    user.accounts.create({balance: 300000, name: "Savings"})
    account = user.accounts.create({balance: 1000, name: "Checking"})
    expect(user.rich?).to be_true
  end
end
