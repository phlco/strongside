require 'spec_helper'

describe "visting the homepage" do
  before(:each) { visit "/" }
  it "displays the homepage" do
    expect(page).to have_content("Welcome to the Bank")
  end

  it "has a link to the login page" do
    expect(page.find('a[href="/login"]')).to be_true
  end

  it "has a link to the create account page" do
    expect(page.find('a[href="/signup"]')).to be_true
  end

  it "takes us to the about page" do
    click_on 'Log In'
    expect(page).to have_css("form")
    expect(page).to have_content("Log In")
  end

  it "takes us to the create account page" do
    click_on 'Create Account'
    expect(page).to have_css("#new_user")
    expect(page).to have_content("New User Account")
  end
end
