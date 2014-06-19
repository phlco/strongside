class CatsController < ApplicationController

  def index
    @cats = Cat.all

    respond_to do |format|
      format.html
      format.json {render json: @cats}

      binding.pry

    end
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new params[:cat]

    respond_to do |format|
      if @cat.save
        format.html {redirect_to @cat}
        format.json {render json: @cat, status: :created, location: @cat}
      else
        format.html {render :new, flash[:error] = "This cat was not saved to the database."}
        format.json {render json @cat.errors, status: :unprocessable_entity}
      end
    end
  end

  def show
    @cat = Cat.find params[:id]
    respond_to do |format|
      format.json do
        render json: @cat
      end
      format.html
    end
  end

  def edit
    @cat = Cat.find params[:id]
  end

  def update
    cat = Cat.find params[:id]
    cat.update_attributes params[:cat]
    redirect_to cat_path(cat)
  end

  def destroy
    Cat.find(params[:id]).destroy
    redirect_to cats_path(cats)
  end

end
