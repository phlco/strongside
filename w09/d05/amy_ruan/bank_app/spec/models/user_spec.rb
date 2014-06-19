# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  name            :string(255)
#  balance         :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe User do


  context "validation" do
    before(:each) {@user = User.new(name: "Amy", email: "amy@gmail.com", password: "hello", password_confirmation: "hello")}
    subject{@user}
    it {should respond_to(:name)}
    # equivalent to
    # it "responds to 'name'" do
    # => expect(@user).to respond_to(:name)
    # end
    it {should respond_to(:email)}
    it {should respond_to(:password_digest)}
    it {should respond_to(:password)}
    it {should respond_to(:password_confirmation)}
    it {should respond_to(:authenticate)}

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email), case_insensitive: true }
    it { should validate_presence_of(:password_digest) }
    it { should ensure_length_of(:password).is_at_least(4)}
    it { should have_many(:accounts) }
    it { should have_many(:transactions) }
    it { should have_secure_password }


    it do
      should_not allow_value('asdfjkl').for(:email)
    end

    describe "when password doesn't match confirmation" do
      before { @user.password_confirmation = "mismatch" }
      it { should_not be_valid }
    end

    it "changes the email address to downcase before save" do
      @user.email = "NYC.JEN@gmail.com"
      @user.save
      expect(@user.email).to eq("nyc.jen@gmail.com")
    end

    it "can be created with a password, password_confirmation, name and email set" do
      @user.password = "kickhash"
      @user.password_confirmation = "kickhash"
      @user.name = "Amy"
      @user.email = "kick@hash.com"
      expect(@user.save).to be_true
    end

  end

end
