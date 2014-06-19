class CatsController < ApplicationController

  def index
    @cats = Cat.all
    respond_to do |format|
      format.json { render json: @cats }
      format.html
    end
  end

  def show
    id = params[:id]
    @cat = Cat.find(id)
    respond_to do |format|
      format.json do
        render json: @cat
      end
      format.html
    end
  end

  def create
    @cat = Cat.create(params[:cat])
    render json: @cat
  end

  def new
    @cat = Cat.new
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    cat = Cat.find(params[:id])
    cat.update_attributes(params[:cat])
    redirect_to cat
  end

  def destroy
    cat = Cat.find(params[:id])
    cat.destroy
    respond_to do |format|
      format.html { redirect_to index.html }
      format.json { render :json => { status: "cool" } }
    end
  end

end