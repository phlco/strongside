class ScraperController < ApplicationController
  def index
    scraper = Scraper.new(url: "http://www.nytimes.com/")
    @links = scraper.get_hrefs
    @images = scraper.get_images
    respond_to do |format|
      format.html
      format.json {render json:
        {:links => @links, :images => @images} }
    end
  end
end
