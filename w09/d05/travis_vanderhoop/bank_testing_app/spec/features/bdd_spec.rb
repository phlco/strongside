require 'spec_helper'

describe "the homepage" do

  # it "displays the homepage" do
  #   visit '/'
  #   expect(page).to have_css("#welcome")
  # end

  # it "has a link to the about page" do
  #   visit '/'
  #   expect(page.find('a[href="/about"]')).to be_true
  # end

  # it "says the Overlook Hotel" do
  #   visit '/'
  #   expect(page).to have_content("Overlook Hotel")
  # end

  # it "takes us to the about page" do
  #   visit '/'
  #   # find('a[href="/about"]').click
  #   click_on 'About us'
  #   expect(page).to have_css("img[src='overlook.png']")
  #   expect(page).to have_css("h1#about_us")
  #   save_and_open_page
  # end

  #js: true ensures we run the tests with javascript

  context "when a new user wants to sign up", js:true do
    before(:each) {visit new_user_registration_path}

    it "displays the signup form" do
      expect(page).to have_css('#new_user')
    end

    it "allows users with valid info to create an account" do
      fill_in "user_email", with: "shmarp@darp.com"
      fill_in "user_password", with: "batman21"
      fill_in "user_password_confirmation", with: "batman21"
      click_button "Sign up"
      expect(page).to have_content "signed up successfully"
    end

  end #context when a new user wants to sign up

  context "when a user has signed up" do
    before(:each) do
      visit new_user_registration_path
      fill_in "user_email", with: "shmarp@darp.com"
      fill_in "user_password", with: "batman21"
      fill_in "user_password_confirmation", with: "batman21"
      click_button "Sign up"
    end
    describe "the account creation process"

      describe "the creating an account button", js:true do

        it "is present" do
          expect(page).to have_content "Create New Account"
        end

        context "when clicked" do

          it "makes visible a form for creating an account" do
            expect(page). to_not have_css("#new-account-form")
          end

          it ""
        end
      end # describe the creating an account button



    end


  end # when a user has signed up

  # describe "signing in", js: true do
  #   before(:each) {visit root_path}

  #   context "when user provides correct user information" do
  #     it "alerts the user that they have signed in" do
  #       fill_in "user_email", with: "vanderhoop@me.com"
  #       fill_in "user_password", with: "batman21"
  #       click_button "Sign in"
  #       expect(page).to have_content "Signed in successfully"
  #     end
  #   end

  # end #describe signing in

end # describe visiting the homepage
