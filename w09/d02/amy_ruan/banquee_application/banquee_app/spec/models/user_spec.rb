require 'spec_helper'

describe User do
  context "validation" do
    it "has a password digest error when password and password confirmation are not set" do
      user = User.new
      user.valid?
      expect(user.errors).to have_key(:password_digest)
    end

    it "does not have a password_digest error when password and password confirmation are set" do
      user = User.new(password: "heyyou", password_confirmation: "heyyou")
      user.valid?
      expect(user.errors).to_not have_key(:password_digest)
    end

    it "has a password error if the length is not 8 characters in length" do
      user = User.new(password: "hello", password_confirmation: "hello")
      user.valid?
      expect(user.errors.messages).to have_key(:password)
    end

    it "has a password error if the length is not 16 characters in length" do
      user = User.new(password: "12345678123456789", password_confirmation: "12345678123456789")
      user.valid?
      expect(user.errors.messages).to have_key(:password)
    end

    it "has no password error if the length is between 8 and 16 characters in length" do
      user = User.new(password: "123456789", password_confirmation: "123456789")
      user.valid?
      expect(user.errors.messages).to_not have_key(:password)
    end

    it "has an email error if email is not set" do
      user = User.new
      user.valid?
      expect(user.errors).to have_key(:email)
    end

    it "has a name error if name is not set" do
      user = User.new
      user.valid?
      expect(user.errors).to have_key(:name)
    end

    it "doesnt have an email error if it is set" do
      user = User.new(email: "amy@gmail.com")
      user.valid?
      expect(user.errors).to_not have_key(:email)
    end

    it "doesnt have a name error if it is set" do
      user = User.new(name: "amy")
      user.valid?
      expect(user.errors).to_not have_key(:name)
    end

    it "has an email error if email is not unique" do
      user1 = User.create(email: "amy@gmail.com", name:"amyy", password: "123456789", password_confirmation: "123456789")

      user2 = User.new(email: "amy@gmail.com", name:"anda", password: "123456789", password_confirmation: "123456789")
      user2.valid?
      expect(user2.errors.messages).to have_key(:email)
    end

    it "has a name error if name is not unique" do
      user1 = User.create(email: "anda@gmail.com", name:"amy", password: "123456789", password_confirmation: "123456789")

      user2 = User.new(email: "amy@gmail.com", name:"amy", password: "123456789", password_confirmation: "123456789")
      user2.valid?
      expect(user2.errors.messages).to have_key(:name)
    end

    it "can be created if email and name are unique and password is 8-16 characters long" do
      user1 = User.create(email: "anda@gmail.com", name:"anda", password: "123456789", password_confirmation: "123456789")

      user2 = User.new(email: "amy@gmail.com", name:"amy", password: "123456789", password_confirmation: "123456789")
      expect(user2.save).to be(true)
    end

    it "can have more than one account" do
      user1 = User.create(email: "anda@gmail.com", name:"anda", password: "123456789", password_confirmation: "123456789")
      user1.accounts.create(name:"savings1", balance:1000)
      user1.accounts.create(name:"savings2", balance:1000)
      expect(user1.accounts.length).to eq(2)
    end

  end

  let(:user1){
      User.create({
        email: "anda@gmail.com",
        name: "anda",
        password: "kickhash1",
        password_confirmation: "kickhash1"
      })
    }

  describe "total_balance method" do
    it "returns the total amount of money they have" do
      user1.accounts.create(name:"savings1", balance:1000)
      expect(user1.total_balance).to eq(1000)
    end
  end

  describe "rich? method" do
    it "returns false if they have less than 100k" do
      user1.accounts.create(name:"savings1", balance:1000)
      expect(user1.rich?).to eq(false)
    end

    it "returns true if they have more than 100k" do
      user1.accounts.create(name:"savings1", balance:100001)
      expect(user1.rich?).to eq(true)
    end
  end

end
