require 'spec_helper'

describe "visiting the homepage" do
  before(:each) { visit root_path }

  it "displays the homepage" do
    expect(page).to have_content("Bank")
  end

  it "says register" do
    expect(page).to have_content("Register")
  end

  it "says account" do
    expect(page).to have_content("Account")
  end

  it "has a link to the transactions page" do
    expect(page.find('a[href="/transactions"]')).to be_true
  end

  it "takes us to the about page" do
    click_on 'Make A Transaction'
    expect(page).to have_css('h1#make_transaction')
    # save_and_open_page
  end

describe "visiting the make a transaction page" do

end


end
