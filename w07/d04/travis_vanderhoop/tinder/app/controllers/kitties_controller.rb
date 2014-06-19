class KittiesController < ApplicationController
  respond_to :json #sets all actions to respond to .json requests

  def index
    @kitties = Kitty.all
    respond_to do |format|
      format.json do                      #if the user appends '.json' to the URL, the page will render the JSON object, @kitties
        render json: @kitties             #NOTE: if the user doesn't append '.json', it will render HTML by default, even if format.html appears second in this method.
      end
      # format.html
    end
  end

  def show
    @kitty = Kitty.find(params[:id])
    respond_to do |format|
      format.json do                      #if the user appends ".json" to the url, it will render the JSON object, @kitty
        render json: @kitty               #NOTE: if the user doesn't append '.json', it will render HTML by default, even if format.html appears second in this method.
      end
      format.html
    end
  end

  def new
    @kitty = Kitty.new
  end

  def create
    @kitty = Kitty.create(params[:kitty])
    redirect_to '/kitties'
  end

  def edit
    @kitty = Kitty.find(params[:id])
  end


  def update
    @kitty = Kitty.update_attributes(params[:kitty])
  end

  def destroy
    @kitty = Kitty.find(params[:id])
    @kitty.destroy
  end

end

