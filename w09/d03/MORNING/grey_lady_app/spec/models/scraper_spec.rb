require 'spec_helper'

describe Scraper do

  describe ".new" do
    it "initializes with a url" do
      expect(Scraper.new("http://nytimes.com")).to be
    end
    it "raises an error without a url" do
      expect { Scraper.new }.to raise_error(ArgumentError)
    end
  end
end
