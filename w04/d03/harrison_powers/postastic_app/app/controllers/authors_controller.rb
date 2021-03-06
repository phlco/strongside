class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    a1 = Author.create params[:author]
    redirect_to "/authors/#{a1.id}"
  end

  def update
    Author.find(params[:id]).update_attributes params[:author]
    redirect_to "/authors/#{params[:id]}"
  end

  def edit
    @author = Author.find params[:id]
  end

  def destroy
    Author.find(params[:id]).destroy
    redirect_to "/authors"
  end

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find params[:id]
  end
end
