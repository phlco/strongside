require 'spec_helper'

describe Account do

  # it "requires a name (any string) and a balance"
  # it "has an opening balance of 0"
  it "will have deposit and withdraw limits"
  it "can't be overdrawn"
  # it "belongs to a user"


  describe 'account creation' do

    let(:account) do
      Account.new
    end

    it "has a name error when name is not set" do
      account.valid?
      expect(account.errors).to have_key(:name)
    end

    it "has an initial balance of 0 when created" do
      account.valid?
      expect(account.balance).to eq 0
    end

    it "has a user_id error if user_id is not set" do
      user = User.create(name: "Quin", email: "quincogdell@gmail.com", password: "12345678", password_confirmation: "12345678")
      account.user = user
      expect(account.user_id).to eq(user.id)
    end

  end




  describe 'input and output limits' do
      let(:user) do
        User.create(name: "Quin", email: "quincogdell@gmail.com", password: "12345678", password_confirmation: "12345678")
      end
      let(:account) do
        Account.create(name: "checking")
      end

    # it "will have a deposit limit error if the deposit amount is over the $10,000 limit" do
    #   account.user = user
    #   account.save
    #   amount = 1000
    #   account.deposit(amount)
    #   account.valid?
    #   binding.pry
    #   expect(account).to_not be_valid
    #   # expect(account.errors).to have_key(:deposit)
    # end

    it "will have a higher balance after a deposit" do
      account.user = user
      account.save
      amount = 5000000
      account.deposit(amount)
      expect(account.balance).to eq amount
    end

    it "will have a lower balance after a withdraw" do
      account.user = user
      account.save
      amount = 5000000
      take_out = 100000
      account.deposit(amount)
      account.withdraw(take_out)

      expect(account.balance).to eq(amount-take_out)
    end

    it "cannot be overdrawn" do
      account.user = user
      account.save
      amount = 500000
      take_out = 700000
      account.deposit(amount)
      account.withdraw(take_out)

      expect(account.balance).to eq(amount)
    end


  end



end
