require 'spec_helper'

describe User do

  describe 'create new users' do
    let(:user) do
      User.new
    end

    it "is has a name error if the user name is not set" do
      user.valid?
      expect(user.errors).to have_key(:name)
    end

    it "does not have a name error when the user name is set" do
      user.name = "Quin"
      user.valid?
      expect(user.errors).to_not have_key :name
    end


    it "is not valid if the user does not have an email" do
      user.name = "Quin"
      user.valid?
      expect(user.errors).to have_key(:email)
    end

    it "has a password_digest error when password and password_confirmation are not set with 8 to 16 characters" do
      user.valid?
      expect(user.errors).to have_key(:password_digest)
    end

    it "has a password_digest error when password and password_confirmation are not set with 8 to 16 characters" do
      user.name = "Quin"
      user.email = "quincogdell@gmail"
      user.password = "123"
      user.password_confirmation = "123"
      user.valid?
      expect(user.errors).to have_key(:password)
    end

    it 'has a name error when the user name is not unique' do
      user.name = "Quin"
      user.email = "quincogdell@gmail.com"
      user.password = "12345678"
      user.password_confirmation = "12345678"
      user.save
      user2 = User.new(name: "Quin")
      user2.valid?
      expect(user2.errors).to have_key(:name)
    end

    it 'has a email error when the email address is not unique' do
      user.name = "Quin"
      user.email = "quincogdell@gmail.com"
      user.password = "12345678"
      user.password_confirmation = "12345678"
      user.save
      user2 = User.new(name: "John", email: "quincogdell@gmail.com", password: "12345678", password_confirmation: "12345678")
      user2.valid?
      expect(user2.errors).to have_key(:email)
    end


    describe "basic user with account(s)" do
      let(:user) do
        User.create(name: "Quin", email: "quincogdell@gmail.com", password: "12345678", password_confirmation: "12345678")
      end
      let(:account) do
        Account.create(name: "checking")
      end

      it "has an account" do
        account.user = user
        account.save
        expect(user.accounts).to eq [account]
      end

      it "has more than one account" do
        account.user = user
        account.save
        account2 = Account.new(name: "savings")
        account2.user = user
        account2.save
        expect(user.accounts).to eq [account, account2]
      end

    end



    it "should have a method total_balance that returns the total amount of money they have"
    it "should have a method rich? that returns true if they have more than 100k"



  end

end
