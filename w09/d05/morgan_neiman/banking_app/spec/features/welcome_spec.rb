require 'spec_helper'

describe 'the home page' do

  before(:each) do
    visit '/'
  end

  it "displays the home page" do
    expect(page).to have_css('#welcome')
  end

  it "says welcome to mo bank" do
    expect(page).to have_content("Welcome to Mo Bank")
  end

  it "has a link to the sign in page" do
    expect(page.find('a[href="/sessions/new"]')).to be_true
  end

  it "takes us to the sign in page" do
    click_on "Sign In"
    expect(page).to have_css('#sign-in')
  end

  it "has a link to sign up" do
    expect(page.find('a[href="/users/new"]')).to be_true
  end

  it "takes us to the sign up page" do
    click_on "Sign Up"
    expect(page).to have_css('#sign-up')
  end

end

describe "the sign up page" do

  before(:each) { visit "/users/new" }

  it "has a signup form" do
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_content('Sign Up')
  end

  it "creates a new user" do
    fill_in "Email", with: "quackhouse@me.com"
    fill_in "Password", with: "kickhash"
    fill_in "Password Confirmation", with: "kickhash"
    click_button "Sign Up"
    expect(page).to have_content("Welcome, quackhouse@me.com")
  end

  it "validates password conf" do
    fill_in "Email", with: "quackhouse@me.com"
    fill_in "Password", with: "kickhash"
    fill_in "Password Confirmation", with: "blarghhhhhh"
    click_button "Sign Up"
    expect(page).to have_content("Sorry, that information was invalid. Did your password and password confirmation match?")
  end

end

describe "the sign in page" do

  before(:each) do
    visit "/users/new"
    fill_in "Email", with: "quackhouse@me.com"
    fill_in "Password", with: "kickhash"
    fill_in "Password Confirmation", with: "kickhash"
    click_button "Sign Up"
    visit "/sessions/new"
  end

  it "has a sign in form" do
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_content('Sign In')
  end

  it "signs you in with valid info" do
    fill_in "Email", with: "quackhouse@me.com"
    fill_in "Password", with: "kickhash"
    click_button "Sign In"
    expect(page).to have_content("Welcome, quackhouse@me.com")
  end

  it "flashes notice with invalid info" do
    fill_in "Email", with: "quackhouse@me.com"
    fill_in "Password", with: "blhhahasjdf;lkasjdf"
    click_button "Sign In"
    expect(page).to have_content("Email or password is invalid")
  end

end

describe "the logged in user's home page" do

  before(:each) do
    visit "/users/new"
    fill_in "Email", with: "quackhouse@me.com"
    fill_in "Password", with: "kickhash"
    fill_in "Password Confirmation", with: "kickhash"
    click_button "Sign Up"
    visit "/sessions/new"
    fill_in "Email", with: "quackhouse@me.com"
    fill_in "Password", with: "kickhash"
    click_button "Sign In"
  end

  it "has the option to make a new account" do
    expect(page.find('a[href="/accounts/new"]')).to be_true
    expect(page).to have_content("Create New Account")
  end

  it "displays a form to create a new account" do
    click_on "Create New Account"
    expect(page).to have_content("Amount")
    expect(page).to have_content("Create Account")
  end

  it "creates a new account & shows it" do
    click_on "Create New Account"
    fill_in "Amount", with: 20
    click_button "Create Account"
    expect(page).to have_content("Account #{Account.last.id}")
  end

  it "displays a link to a page to manage the account" do
    click_on "Create New Account"
    fill_in "Amount", with: 20
    click_button "Create Account"
    expect(page.find("a[href='/accounts/#{Account.last.id}']")).to be_true
  end

end

describe "a single account's page" do
  before(:each) do
    visit "/users/new"
    fill_in "Email", with: "quackhouse@me.com"
    fill_in "Password", with: "kickhash"
    fill_in "Password Confirmation", with: "kickhash"
    click_button "Sign Up"
    visit "/sessions/new"
    fill_in "Email", with: "quackhouse@me.com"
    fill_in "Password", with: "kickhash"
    click_button "Sign In"
    click_on "Create New Account"
    fill_in "Amount", with: 20
    click_button "Create Account"
    click_on "Account #{Account.last.id}"
  end

  it "displays available funds" do
    expect(page).to have_content("Current funds: 20")
  end

  it "has a transfer link" do
    expect(page).to have_content("Transfer Money")
    expect(page.find("a[href='/accounts/#{Account.last.id}/transfers/new']")).to be_true
  end

  it "has a destroy link" do
    expect(page).to have_content("Delete Account")
  end

  it "destroys the account when you click delete" do
    click_on "Delete Account"
    expect(page).to have_content("You have no accounts")
  end

end

describe "the transfer page" do
  before(:each) do
    visit "/users/new"
    fill_in "Email", with: "quackhouse@me.com"
    fill_in "Password", with: "kickhash"
    fill_in "Password Confirmation", with: "kickhash"
    click_button "Sign Up"
    visit "/sessions/new"
    fill_in "Email", with: "quackhouse@me.com"
    fill_in "Password", with: "kickhash"
    click_button "Sign In"
    click_on "Create New Account"
    fill_in "Amount", with: 20
    click_button "Create Account"
    click_on "Account #{Account.last.id}"
    click_on "Transfer Money"
  end

  it "displays a transfer form" do
    expect(page.find("input[name='Amount']")).to be_true
    expect(page.find("input[name='Recipient']")).to be_true
  end

  it "withdraws money if you choose withdraw" do
    fill_in "Kind", with: "Withdrawal"
    fill_in "Amount", with: "10"
    click_button "Complete Transfer"
    click_on "Account #{Account.last.id}"
    expect(page).to have_content("Current funds: 10")
  end

end