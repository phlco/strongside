class CatsController < ApplicationController

  def index
    @cats = Cat.all
    # index.html.erb
    respond_to do |format|
      format.html
      format.json do
        render json: @cats
      end
    end
  end

  def new
    @cat = Cat.new

  end

  def create
    binding.pry
    @cat= Cat.create(params)
    redirect_to "/"
  end

  def edit

  end

def show


end


end