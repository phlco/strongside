require 'spec_helper'

# As an unregistered user
# When I visit the site
# And click on "Sign up"
# And fill in my details
# And click on "Sign up"
# Then I should see "Thanks for signing up"

describe "Sign up process" do
  it "Creates new user" do
    visit root_path
    click_link "Sign up"
    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "12345678"
    fill_in "Password Confirmation", with: "12345678"
    click_button "Sign up"
    expect(page).to have_content("Thanks for signing up")
  end
end

# As a registered user
# When I visit the site
# And click on "Login"
# And fill in my details
# And click on "Login"
# Then I should see "Welcome back"

describe "Login" do
  before(:each) { User.create(email: "example@example.com", password: '12345678', password_confirmation: '12345678') }
  it "logs in registered user" do
    visit root_path
    click_link "Login"
    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "12345678"
    click_button "Login"
    expect(page).to have_content("Welcome Back")
  end
end
