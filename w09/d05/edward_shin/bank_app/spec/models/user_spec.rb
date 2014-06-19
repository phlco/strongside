# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password        :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe User do
  context "when creating a new user" do

    let(:user) {User.new}

    it "has an error without an email" do
      user.valid?
      expect(user.errors).to have_key(:email)
    end

    it "creates user with valid email" do
      user.email = "eddie@shin.com"
      user.valid?
      expect(user.valid?).to be_false
    end

    it "has error if email already exists" do
      user.email = "eddie@shin.com"
      user.save
      user1 = User.new
      user1.email = "eddie@shin.com"
      user1.valid?
      expect(user1.save).to be_false
    end

    it "has an error when password doesnt match confirmation password" do
      user.email = "eddie@shin.com"
      user.password = "kickhash"
      user.password_confirmation = "kickhash1"
      expect(user.save).to be_false
    end

    it "has an error when a password is less then 6 characters" do
      user.email = "eddie@shin.com"
      user.password = "kick"
      user.password_confirmation = "kick"
      expect(user.save).to be_false
    end

    it "has an error when a password is over 16 characters" do
      user.email = "eddie@shin.com"
      user.password = "kickhashkickhashkickhash"
      user.password_confirmation = "kickhashkickhashkickhash"
      expect(user.save).to be_false
    end
  end
end
