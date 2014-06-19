require 'spec_helper'

describe Scraper do

  it "should store the url passed to it in initialize" do
    scraper = Scraper.new("http://jonl.org/")
    expect( scraper.url ).to eq("http://jonl.org/")
  end

  describe "#get_hrefs" do
    it "should return all the links on a page" do
      scraper = Scraper.new("http://jonl.org/")
      true_array = ["Hi/Happier/Happier.html",
                    "Hi/Engineer/Engineer.html",
                    "Hi/Composer/Composer.html",
                    "Hi/Entrepreneur/Entrepreneur.html",
                    "http://blog.jonl.org",
                    "attachments/Jonathan_Leung's_Resume.pdf",
                    "http://facebook.com/friendjonathanleung",
                    "http://twitter.com/jonathanjleung"]
      expect( scraper.get_hrefs).to eq(true_array)
    end
  end


  describe '#get_images' do
    it "should return all the images on a page" do
      scraper = Scraper.new("http://api.jquery.com/")
      true_array = ["http://api.jquery.com/jquery-wp-content/themes/jquery/content/books/learning-jquery-4th-ed.jpg",
                    "http://api.jquery.com/jquery-wp-content/themes/jquery/content/books/jquery-in-action.jpg",
                    "http://api.jquery.com/jquery-wp-content/themes/jquery/content/books/jquery-succinctly.jpg" ]
      expect( scraper.get_images).to eq(true_array)
    end
  end

end
