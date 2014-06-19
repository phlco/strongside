class CatsController < ApplicationController
  def index
    @cats = Cat.all
    respond_to do |format|
      format.html
      format.json { render json: @cats }
    end
  end

  def new
    @cat = Cat.new
  end

  def create
    newCat = Cat.new params[:cat]
    if newCat.save
      respond_to do |format|
        format.html { redirect_to cat_path(newCat) }
        format.json { render json: newCat }
      end
    end
  end

  def show
    @cat = Cat.find params[:id]
    respond_to do |format|
      format.html
      format.json { render json: @cat }
    end
  end

  def edit
    @cat = Cat.find params[:id]
  end

  def update
    cat = Cat.find params[:id]
    if params[:cat]
      cat.update_attributes params[:cat]
    else
      vote = params[:vote]
      vote == "Vote Up" ? cat.score += 1 : cat.score -= 1
      cat.save
    end
    redirect_to cat_path(cat)
  end

  def destroy
    cat = Cat.find params[:id]
    cat.destroy
    redirect_to root_path
  end

  def random
    cats = Cat.all
    randomId = cats.sample.id
    respond_to do |format|
      format.html { redirect_to "/cats/#{randomId}" }
      format.json { redirect_to "/cats/#{randomId}.json" }
    end
  end

end
