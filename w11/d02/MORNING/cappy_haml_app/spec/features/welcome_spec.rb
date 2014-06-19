require 'spec_helper'
#  _______  _______  _______  __   __  _     _  __   __  _______  ______
# |       ||   _   ||       ||  | |  || | _ | ||  | |  ||   _   ||      |
# |       ||  |_|  ||    _  ||  |_|  || || || ||  |_|  ||  |_|  ||___   |
# |       ||       ||   |_| ||       ||       ||       ||       |  __|  |
# |      _||       ||    ___||_     _||       ||       ||       | |_____|
# |     |_ |   _   ||   |      |   |  |   _   ||   _   ||   _   |   __
# |_______||__| |__||___|      |___|  |__| |__||__| |__||__| |__|  |__|
# http://jnicklas.github.io/capybara/
# (\~---.
#  /   (\-`-/)
# (      ' ' )          # https://learn.thoughtbot.com/test-driven-rails-resources/capybara.pdf
#  \ (  \_Y_/\          # https://gist.github.com/zhengjia/428105
#   ""\ \___//
#      `w   "
describe "HAML Practice" do
  it "is white space sensitive and doesn't have closing tags" do
    visit '/'
    click_link "haml practice"
    expect(current_path).to eq('/haml')
    within('h1#haml-time') { expect(page).to have_content("HAML Time")}
    expect(page).to have_css('ul li a.banana#ripe')
    expect(page).to have_css("nav ul li a[href='/quiz']")
    expect(page).to have_css('section article.one')
    expect(page).to have_css('table thead tr.first')
    within('table') { expect(page).to have_content("hearts moons stars")}
    expect(page).to have_css('form input[type=checkbox]')
    expect(page).to have_css('label[for=fave_cereal]')
    expect(page).to have_css('select#fave_cereal')
    expect(page).to have_css('footer')
  end
end

describe "The Quiz" do

  it "has a link to take us to the Sorting Quiz" do
    visit '/'
    click_link "sorting quiz"
    expect(page).to have_content "Sorting Quiz"
    expect(current_path).to eq('/quiz')
  end

  it "has a text input where we can enter a string of numbers" do
    visit '/quiz'
    within("#quiz") { expect(page).to have_css("input[name='numbers']") }
    within("#quiz") { expect(page).to have_css('button') }
  end

  describe "when i click the 'sort' button", js: true do
    before(:each) do
      visit '/quiz'
      within("#quiz") { fill_in 'numbers', with: "-1, 4, 2, 8, 1, 20" }
      click_button "sort"
    end

    it "removes the input" do
      expect(page.has_no_field? 'numbers').to be true
      expect(page.has_no_button? 'sort').to be true
    end

    it "displays the numbers in ascending order" do
      expect(page).to have_content "-1, 1, 2, 4, 8, 20"
    end

  end

end

# More!

describe "the second part", js: true do
  before(:each) do
    visit '/quiz'
  end
  it "has a button called Random Ajax Numbers" do
    expect(page.has_button? "Random Ajax Numbers").to be_true
  end
  it "takes a number from the input field and returns a random array" do
    within("#quiz") do
      fill_in 'numbers', with: "5"
      click_button "Random Ajax Numbers"
    end
    numbers = find_field('numbers').value.split(',')
    puts numbers
    puts numbers.size
    expect(numbers.size).to eq 5
    save_and_open_page
  end
end
