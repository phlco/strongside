require 'spec_helper'

describe "The Home Page" do

  before(:each) do
    visit '/'
  end

  it "says 'hello and welcome'" do
    expect(page).to have_content("hello and welcome")
  end

  it "has the title 'Week 10'" do
    expect(page).to have_title "Week 10"
  end

  it "has a link to /javascript" do
    find_link('JavaScript').click
    expect(page).to have_content('Java Jive')
    expect(current_path).to eq('/javascript')
  end

end

describe 'A page called JavaScript' do

  before(:each) do
    visit '/javascript'
  end

  it "Has an h1 with the text 'Java Jive'" do
    h1 = page.find('h1')
    text = 'Java Jive'
    expect(h1.has_content?(text)).to be true
  end

  it "has a button labeled 'Click Me!'" do
    button = page.find('button')
    label = 'Click Me!'
    expect(button.has_content?(label)).to be true
  end

  describe "clicking the button with JavaScript enabled", :js => true do

    before(:each) do
      click_button('Click Me!');
    end

    it "changes the h1's text to Jabba Jive using jQuery" do
      expect(page).to have_content('Jabba Jive')
      expect(page).to have_no_content('Java Jive')
    end

    it "changes the body's background to pink", :js => true do
      expect(page).to have_css('body.pink')
    end

    it "disables the button", :js => true do
      button = page.find('button')
      expect(button.disabled?).to be true
    end

  end

end

describe "quiz" do
  before(:each) do
    visit '/'
  end
  # There should be a link on the home page called "quizzes"
  it "has a link on the home page called quizzes" do
    find_link('Quizzes').click
    expect(page).to have_content('Quiz')
    expect(current_path).to eq('/quizzes')
  end

  it "has a button labeled 'calc'" do
    visit '/quizzes'
    button = page.find('button')
    label = 'calc'
    expect(button.has_content?(label)).to be true
    expect(page).to have_no_css('form')
  end

  it "has a text field to input numbers" do
    visit '/quizzes'
    fill_in 'calc_input', :with => '1, 2, 3'
    calc = find_field('calc_input')
    expect(calc.value).to eq '1, 2, 3'
  end

  it "turns green when sorted numbers are entered", js: true do
    visit "/quizzes"
    fill_in 'calc_input', :with => '1, 2, 3'
    click_button("calc")
    expect(page).to have_css("body.green")
    expect(page).to have_no_css("body.red")
  end
  it "turns red when unsorted numbers are entered", js: true do
    visit "/quizzes"
    fill_in 'calc_input', :with => '1, 3, 2'
    click_button("calc")
    expect(page).to have_css("body.red")
    expect(page).to have_no_css("body.green")
  end
end
