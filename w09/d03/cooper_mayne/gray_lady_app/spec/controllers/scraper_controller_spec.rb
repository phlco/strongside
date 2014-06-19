require 'spec_helper'

describe ScraperController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'links'" do
    it "returns http success" do
      get 'links'
      response.should be_success
    end
  end

  describe "GET 'pictures'" do
    it "returns http success" do
      get 'pictures'
      response.should be_success
    end
  end

end
