require 'spec_helper'

describe Scraper do
  it "scraper will have errors if you dont pass in parameter for url" do
    expect{Scraper.new}.to raise_error(ArgumentError)
  end

  it "initalizes with url" do
    expect{Scraper.new(url: "http://nytimes.com")}.to_not raise_error
  end

  describe "get_hrefs" do
    it "will return hrefs if you pass the url" do
      scraper = Scraper.new(url: "http://jonl.org/")
      expect(scraper.get_hrefs).to include("Hi/Engineer/Engineer.html")
    end
  end

  describe "get_images" do
    it "will return images array if you pass the url" do
      scraper = Scraper.new(url: "https://generalassemb.ly/")
      expect(scraper.get_images).to include("//d3o09jpaxs6yh2.cloudfront.net/production/assets/student_stories/circles/larry-f177289f8a52daf70706b155911a654e.jpg")
    end
  end
end
