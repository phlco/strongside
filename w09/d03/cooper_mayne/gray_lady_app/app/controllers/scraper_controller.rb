class ScraperController < ApplicationController
  def index
  end

  def links
    scraper = Scraper.new(params[:url])
    links_array = scraper.get_hrefs
    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => links_array }
    end
  end

  def pictures
    scraper = Scraper.new(params[:url])
    image_array = scraper.get_images
    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => image_array }
    end
  end
end
