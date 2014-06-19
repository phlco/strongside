require 'spec_helper'

describe "homepage" do

  before(:each) do
    visit "/"
  end

  it "displays the homepage" do
    expect(page).to have_css("#welcome")
  end

  it "has a link to login" do
    expect(page.find('a[href="/login"]')).to be_true
  end

  it "takes you to the login page" do
    find('a[href="/login"]').click
    expect(page).to have_css('#login-form')
  end

  it "has a link to the sign up page" do
    expect(page.find('a[href="/signup"]')).to be_true
  end

  it "take you to the sign up page" do
    find('a[href="/signup"]').click
    expect(page).to have_css('#signup-form')
  end

end

describe "signup page" do
  before(:each) do
    visit '/signup'
  end

  it "creates a new user" do
    fill_in "Name", with: "Eddie"
    fill_in "Email", with: "eddie@shin.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create User"
    visit '/users'
    expect(page).to have_content("Eddie")
  end

  it "redirects to login page" do
    fill_in "Name", with: "Eddie"
    fill_in "Email", with: "eddie@shin.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create User"
    expect(page).to have_css('#login-form')
  end

end

describe "login page" do
  before(:each) do
    visit '/login'
  end

  let(:user) do
    User.create(
      name: "Eddie",
      email: "eddie@shin.com",
      password: "password",
      password_confirmation: "password"
      )
  end

  it "it creates a new sessions" do
    user
    fill_in "Email", with: "eddie@shin.com"
    fill_in "Password", with: "password"
    click_button "Login"
    expect(page).to have_css('#accounts')
  end

end

describe "logged in user" do

  before(:each) do
    visit '/signup'
    fill_in "Name", with: "Eddie"
    fill_in "Email", with: "eddie@shin.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create User"
    fill_in "Email", with: "eddie@shin.com"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  it "has add account link that takes you to new account form" do
    find('a[href="/accounts/new"]').click
    expect(page).to have_css('#account-form')
  end

  context "when clicking on Add Account" do
    it "add an account" do
      find('a[href="/accounts/new"]').click
      fill_in "Name", with: "checking"

    end
  end



end
