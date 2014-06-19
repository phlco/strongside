require 'spec_helper'

describe "visiting the homepage" do
 before(:each) { visit '/' }

  it "displays the homepage" do
    expect(page).to have_css(".page")
  end

  it "say Bond Films Info" do
    expect(page).to have_content("Bond Films Info")
  end

  it "has Table bar with list of movie info", js: true do
    expect(page).to have_content("Title")
    expect(page).to have_content("Year")
    expect(page).to have_content("Actor")
    expect(page).to have_content("Gross")
  end

  it "has movie info listed", js: true do
    expect(page).to have_content("2012")
    expect(page).to have_content("Skyfall")
    expect(page).to have_content("Daniel Craig")
    expect(page).to have_content("$1,108,561,008")
  end

  describe "the magic buttons" do
    before(:each) { visit '/' }

    it "has a button to find All Bonds", js: true do
      expect(page.find('a[id="all"]')).to be_true
    end
    it "has a button to find total gross", js: true do
      expect(page.find('a[id="tot"]')).to be_true
    end
    it "has a button to find Star Count", js: true do
      expect(page.find('a[id="str"]')).to be_true
    end
    it "has a button to find Loneliest Bond", js: true do
      expect(page.find('a[id="lon"]')).to be_true
    end
    it "has a button to find Odd Bond", js: true do
      expect(page.find('a[id="odd"]')).to be_true
    end
    it "has a button to find Best Bond", js: true do
      expect(page.find('a[id="bst"]')).to be_true
    end
    it "has a button to find Worst Bond", js: true do
      expect(page.find('a[id="wst"]')).to be_true
    end


    it "displays All Bonds when chosen", js: true do
      click_on "All Bonds"
      expect(page).to have_content('"Daniel Craig","Sean Connery"')
    end
    it "displays Total Gross when chosen", js: true do
      click_on "Total Gross"
      expect(page).to have_content("13821621224")
    end
    it "displays Star Count when chosen", js: true do
      click_on "Star Count"
      expect(page).to have_content('"Daniel Craig":3')
    end
    it "displays Loneliest Bond when chosen", js: true do
      click_on "Loneliest Bond"
      expect(page).to have_content('"George Lazenby"')
    end
    it "displays Odd year Bonds when chosen", js: true do
      click_on "Odd Bonds"
      expect(page).to have_content('"Thunderball","Live and Let Die"')
    end
    it "displays Best Bond when chosen", js: true do
      click_on "Best Bond"
      expect(page).to have_content('"actor":"Daniel Craig"')
    end
    it "displays Worst Bond when chosen", js: true do
      click_on "Worst Bond"
      expect(page).to have_content('"actor":"Timothy Dalton"')
    end

  end

end