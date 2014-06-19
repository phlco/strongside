class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def new
    @cat = Cat.new
  end

  def create
    #params[:cat]
    #=> {"name"=>"kitten", "age"=>"12", "tagline"=>"Cuttie", "image"=>"www.com"}
    cat = Cat.new
    cat.name = params[:cat][:name]
    cat.age = params[:cat][:age]
    cat.tagline = params[:cat][:tagline]
    cat.image = params[:cat][:image]
    cat.save

    redirect_to("/cats/#{cat.id}")
  end

  def show
    cat_id = params[:id]

    @cat = Cat.where(id: cat_id)[0]

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
