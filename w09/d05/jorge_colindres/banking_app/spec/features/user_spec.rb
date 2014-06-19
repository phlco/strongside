require 'spec_helper'


  describe "visiting the create account page" do
    before(:each) { visit signup_path }

    it "has a form for creating a new account" do
      expect(page).to have_css("form")
      expect(page).to have_button("Create User")
    end

    it "should have a link back to the root" do
      expect(page).to have_link("Back")
      click_on "Back"
      expect(page).to have_content("Welcome to the Bank")
    end

    it "should ask for an email" do
      expect(page).to have_content("Email")
      expect(page).to have_css("#user_email")
    end

    it "should ask for a password and password confirmation" do
      expect(page).to have_content("Password")
      expect(page).to have_css("#user_password")
      expect(page).to have_content("Password confirmation")
      expect(page).to have_css("#user_password_confirmation")
    end
  end

  describe "creating an account with mistakes" do
    before(:each) { visit signup_path }

    it "displays an error flash if email is blank" do
      page.fill_in "Email", :with => ""
      page.fill_in "Password", :with => "12345678"
      page.fill_in "Password confirmation", :with => "12345678"
      click_on "Create User"
      expect(page).to have_content "error"
    end

    it "displays an error flash if password is blank" do
      page.fill_in "Email", :with => "test@test.net"
      page.fill_in "Password", :with => ""
      page.fill_in "Password confirmation", :with => ""
      click_on "Create User"
      expect(page).to have_content "error"
    end

    it "displays an error flash if email is already taken" do
      User.create(email: "test@test.net", password: "12345678", password_confirmation: "12345678")
      page.fill_in "Email", :with => "test@test.net"
      page.fill_in "Password", :with => "12345678"
      page.fill_in "Password confirmation", :with => "12345678"
      click_on "Create User"
      expect(page).to have_content "error"
    end

    it "displays an error flash if password doesn't match password confirmation" do
      page.fill_in "Email", :with => "test@test.net"
      page.fill_in "Password", :with => "12345678"
      page.fill_in "Password confirmation", :with => "1234"
      click_on "Create User"
      expect(page).to have_content "error"
    end

    it "displays an error flash if password is too short (>6)" do
      page.fill_in "Email", :with => "test@test.net"
      page.fill_in "Password", :with => "123"
      page.fill_in "Password confirmation", :with => "123"
      click_on "Create User"
      expect(page).to have_content "error"
    end
  end

  describe "creating a valid user account" do
    before(:each) do
      visit signup_path
      page.fill_in "Email", :with => "test@test.net"
      page.fill_in "Password", :with => "12345678"
      page.fill_in "Password confirmation", :with => "12345678"
      click_on "Create User"
    end

    it "it redirects to the login page" do
      expect(page).to have_content "Log In"
    end

    it "display a success flash" do
      expect(page).to have_content "Success"
    end
  end

  describe "the user page" do
    before(:each) do
      @user = User.create(email: "test@test.net", password: "12345678", password_confirmation: "12345678")
      @user.bank_accounts.create(name: "Checking", balance: 50.00)
      @user.bank_accounts.create(name: "Savings", balance: 100.00)
      visit login_path
      page.fill_in "email", :with => @user.email
      page.fill_in "password", :with => @user.password
      click_button "Log In"
    end

    it "lists all the user's bank accounts as links" do
      expect(page).to have_content "Your Bank Accounts"
      expect(page).to have_link "Checking"
      expect(page).to have_link "Savings"
      expect(page).to have_css ".bank-account"
    end

    it "shows the total balance" do
      expect(page).to have_content "Total Balance"
      expect(page).to have_content "$150.00"
      expect(page).to have_css "#total-balance"
    end

    it "shows the account balance beside every account" do
      expect(page).to have_content "$50.00"
      expect(page).to have_content "$100.00"
    end

    it "has a deposit link" do
      expect(page).to have_link "Deposit"
      click_link "Deposit"
      # expect(page).to have_content "New Deposit"
    end

    it "has an add account link" do
      expect(page).to have_link "Add Account"
      click_link "Add Account"
      expect(page).to have_content "New Bank Account"
    end

    it "has a new transaction link" do
      expect(page).to have_link "Withdraws/Transfers"
      click_link "Withdraws/Transfers"
      # expect(page).to have_content "New Account Transaction"
    end

end
