require 'spec_helper'

describe User do

  describe "when created" do

    let(:user) { User.new }

    it "is invalid without a username" do
      expect(user).to have(1).error_on(:username)
    end

    it "is valid with a username" do
      user.username = "jd"
      user.valid?
      expect(user.errors).to_not have_key(:username)
    end

    it "is invalid without a password and password confirmation" do
      expect(user).to_not be_valid
    end

    it "has a password error when the password is less than 8 characters" do
      user.password = "hi"
      user.password_confirmation = "hi"
      user.valid?
      expect(user.errors).to have_key(:password)
    end

    it "does not have a password error when the password is between 8 and 16 characters" do
      user.password = "kickhash"
      user.password_confirmation = "kickhash"
      user.valid?
      expect(user.errors).to_not have_key(:password)
    end

    it "has a password error when the password is longer than 16 characters" do
      user.password = "passwordlongerthansixteen"
      user.password_confirmation = "passwordlongerthansixteen"
      user.valid?
      expect(user.errors).to have_key(:password)
    end

    it "must have a unique username" do
      user.username = "jimmyd"
      user.password = "kickhash"
      user.password_confirmation = "kickhash"
      user.save

      user2 = User.new
      user2.username = "jimmyd"
      user2.password = "kickhash"
      user2.password_confirmation = "kickhash"
      expect(user2.save).to be_false
    end

  end


end
