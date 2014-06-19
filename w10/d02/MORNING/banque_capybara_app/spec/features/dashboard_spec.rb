require 'spec_helper'

describe "Dashboard" do

  before(:each) do

    @user = User.create(email: "example@example.com", password: '123456789', password_confirmation: '123456789')
    @user.accounts.create(balance: 500)
    @user.accounts.create(balance: 500, name: 'Savings')

    visit root_path
    if page.has_content? "Logout"
      click_link "Logout"
    end
    click_link "Login"
    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "123456789"
    click_button "Login"

  end

  describe "Deposit" do
    it "shows deposit form", js: true do
      click_button "Make Deposit"
      expect( page.find('#deposit-form').visible? ).to be_true
    end
  end
  # As a logged in user
  # When I visit my dashboard
  # Then I should see my accounts and total balance

  describe "Accounts" do
    it "lists accounts" do
      expect(page).to have_content("Checking")
      expect(page).to have_content("Savings")
    end
    it "displays total balance" do
      expect(page).to have_content("Total Balance")
      expect(page).to have_content("$1000")
    end
  end

  # As a logged in user
  # When I visit my dashboard
  # And click on "Add Account"
  # And fill in my new account details
  # And click on "Create Account"
  # Then I should see that account on my dashboard
  # And my total balance should reflect the new change

  describe "Add Account" do
    it "creates a new account" do
      click_link "Add Account"
      fill_in "Name", with: "IRA"
      fill_in "Balance", with: 50
      click_button "Create Account"
      expect(page).to have_content("IRA")
      expect(page).to have_content("$1050")
    end
  end

  # As a logged in user
  # When I visit my dashboard
  # And click on one of my accounts
  # Then I should see the account history of that account

  describe "Account History" do
    it "lists history of account" do
      click_on "Checking"
      expect(page).to have_content("Checking")
      expect(page).to have_css('.history')
    end
  end

  describe "Making a deposit" do

    it "creates a new deposit", js: true do
      click_button "Make Deposit"
      select 'Savings', from: 'deposit-account'
      fill_in "Amount", with: 47
      click_button "Deposit"
      expect(page).to have_content("Total Balance: $1047")
    end

  end

  # As a logged in user
  # When I visit my dashboard
  # And click on Withdraw/Transfer
  # And fill in the withdraw details
  # And select an account
  # And click on "Confirm"
  # Then my total balance should reflect the change

  describe "Making a withdraw", js: true do
    it "removes money from a specified account" do
      click_on "Withdraw/Transfer"
      fill_in "withdraw-amount", with: 50
      click_button "Confirm"
      expect(page).to have_content "$950"
    end
  end

  # As a logged in user
  # When I visit my dashboard
  # When I click on Withdraw/Transfer
  # And fill in the transfer details
  # And select an account
  # And click on "Confirm"
  # Then my total balance should reflect the change

  describe "Make a transfer", js: true do
    it "moves money from one account to the other" do
      click_on "Withdraw/Transfer"
      select 'Checking', from: 'withdraw-account'
      fill_in "withdraw-amount", with: 50
      choose "Transfer"
      select 'Savings', from: 'transfer-to-account'
      click_button "Confirm"
      expect(page).to have_content("$450")
    end
  end
end
