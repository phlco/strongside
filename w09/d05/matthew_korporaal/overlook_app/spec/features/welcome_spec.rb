require 'spec_helper'

describe "visting the homepage" do
  before(:each) { visit "/" }
  it "displays the homepage" do
    expect(page).to have_css("#welcome")
  end
  it "says the overlook hotel" do
    expect(page).to have_content("Overlook Hotel")
  end
  it "has a link to the about page" do
    expect(page.find('a[href="/about"]')).to be_true
  end
  it "takes us to the about page" do
    #find('a[href="/about"]').click
    click_on 'About Us'
    expect(page).to have_css("img[src='overlook.png']")
    expect(page).to have_css("h1#about_us")
    #save_and_open_page
  end

end
describe "signing the guestbook" do
  before(:each) { visit "/about" }
  it "has a guestbook form" do
    expect(page).to have_css("#guestbook")
  end
  it "creates a new entry" do
    # label text or name input
    fill_in "Guestbook", with: "Great trip"
    click_button "Sign Guestbook"
    expect(page).to have_content("Thanks for Signing!")
  end
  it "list all previous entries" do
    fill_in "Guestbook", with: "Nice place"
    click_button "Sign Guestbook"
    visit "/about"
    expect(page).to have_content('Nice place')
  end
end

describe "registering for the hotel", js: true do
  before(:each) { visit root_path}
  it "links off the home hpage" do
    expect(page).to have_content("Register")
  end
  it "registers a user with ajax" do
    click_on "Register"
    expect(page).to have_content("Registration Form")
    fill_in "Name", with: "Jack"
    click_button "Register"
    expect(page).to have_content "Welcome, Jack"
  end
end




