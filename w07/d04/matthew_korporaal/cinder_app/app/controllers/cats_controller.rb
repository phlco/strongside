class CatsController < ApplicationController

  def index
    @cats = Cat.all

    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @cats}
    end
  end

  def new
    @cat = Cat.new
  end

  # GET /cats
  # GET /cats.json
  def create
    @cat = Cat.new(params[:cat])
    if @cat.save
      redirect_to @cat, notice: 'Cat has been created'
    else
      render action: "new"
    end
  end

  # GET /cats/1/edit
  def edit
    @cat = Cat.find(params[:id])
  end

  # PUT /cats/1
  # PUT /cats/1.json
  def update
    @cat = Cat.find(params[:cat])

    if @cat.update_attributes(params[:cat])
      redirect_to @cat, notice: 'Cat updated'
    else
      render action: "edit"
    end
  end

  # GET /cats/1
  # GET /cats/1.json
  def show
    @cat = Cat.find(params[:id])

    respond_to do |format|
      format.xml do
        render xml: @cat
      end
      format.json do
        render json: @cat
      end
      format.html
    end
    # default show.html.erb
  end

  # DELETE /cats/1
  # DELETE /cats/1.json
  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy
    respond_to do |format|
      format.html { redirect_to cats_url }
      format.json { head :no_content }
    end
  end
end