require 'spec_helper'
require 'features/shared/login_helper'
include LoginHelper

feature "Adding accounts" do
  scenario "logged in user clicks add account button" do
    login
    expect(page).to have_content "Welcome Back"
  end
end
