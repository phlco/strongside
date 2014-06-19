require 'spec_helper'


  describe "visiting the login page" do
    before(:each) { visit login_path }

    it "has a form for creating a new account" do
      expect(page).to have_css("form")
      expect(page).to have_button("Log In")
    end

    it "should have a link back to the root" do
      expect(page).to have_link("Back")
      click_on "Back"
      expect(page).to have_content("Welcome to the Bank")
    end

    it "should ask for an email" do
      expect(page).to have_content("Email")
      expect(page).to have_css("#email")
    end

    it "should ask for a password and password confirmation" do
      expect(page).to have_content("Password")
      expect(page).to have_css("#password")
    end
  end

  describe "unsuccesfully logging in" do
    before(:each) do
      @user = User.create(email: "test@test.net", password: "12345678", password_confirmation: "12345678")
      visit login_path
    end

    it "displays an error flash if password is blank" do
      page.fill_in "email", :with => @user.email
      page.fill_in "password", :with => ""
      click_button "Log In"
      expect(page).to have_content "invalid"
    end

    it "displays an error flash if email is blank" do
      page.fill_in "email", :with => ""
      page.fill_in "password", :with => @user.password
      click_button "Log In"
      expect(page).to have_content "invalid"
    end

    it "display an error flash if email doesn't match records" do
      page.fill_in "email", :with => "wrong@test.net"
      page.fill_in "password", :with => @user.password
      click_button "Log In"
      expect(page).to have_content "invalid"
    end

    it "display an error flash if password doesn't match records" do
      page.fill_in "email", :with => @user.email
      page.fill_in "password", :with => "wrongpassword"
      click_button "Log In"
      expect(page).to have_content "invalid"
    end
  end

  describe "succesfully logging in" do
    before(:each) do
      @user = User.create(email: "test@test.net", password: "12345678", password_confirmation: "12345678")
      visit login_path
      page.fill_in "email", :with => @user.email
      page.fill_in "password", :with => @user.password
      click_button "Log In"
    end

    it "redirects to the users page" do
      expect(page).to have_content @user.email
    end

    it "displays a log out link" do
      expect(page).to have_content "Log Out"
    end

    it "displays a welcome back flash" do
      expect(page).to have_content "Welcome back"
    end
  end

  describe "succesfully logging out" do
    before(:each) do
      @user = User.create(email: "test@test.net", password: "12345678", password_confirmation: "12345678")
      visit login_path
      page.fill_in "email", :with => @user.email
      page.fill_in "password", :with => @user.password
      click_button "Log In"
      click_link "Log Out"
    end

    it "displays a logged out flash" do
      expect(page).to have_content("Logged out")
    end

    it "redirects back to the log in page" do
      expect(page).to have_content("Log In")
    end
  end

  describe "unlogged in users" do
    before(:each) do
      @user = User.create(email: "test@test.net", password: "12345678", password_confirmation: "12345678")
    end

    it "prevents an unlogged in user from accessing account pages" do
      visit user_path(@user)
      expect(page).to have_content "Not logged in"
    end

    it "prevents logged in users from accessing other users account pages" do
      visit login_path
      page.fill_in "email", :with => @user.email
      page.fill_in "password", :with => @user.password
      click_button "Log In"
      other_user = User.create(email: "test2@test.net", password: "12345678", password_confirmation: "12345678")
      visit user_path(other_user)
      expect(page).to have_content "Not your account"
    end

end
