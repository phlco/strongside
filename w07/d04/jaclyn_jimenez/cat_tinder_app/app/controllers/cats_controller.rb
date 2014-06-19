class CatsController < ApplicationController

  def index
    @cats = Cat.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cats }
    end
  end

  def new
    @cat = Cat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: {age: nil, image_url: nil, name: nil, tag_line: nil} }
    end

  end

  def show
    @cat = Cat.find_by_id(params[:id])
    respond_to do |format|
      format.json {render json: @cat}
      format.html
    end
  end

  def create
  @cat = Cat.create(params[:cat])
    respond_to do |format|
      if @cat.save
        format.html { redirect_to @cat, notice: 'Cat was successfully created.' }
        format.json { render json: @cat, status: :created, location: @cat }
      else
        format.html { render action: "new" }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @cat = Cat.find_by_id(params[:id])
  end

  def update
    @cat = Cat.find_by_id(params[:id])
    respond_to do |format|
      if @cat.update_attributes(params[:cat])
        format.html {redirect_to @cat, notice: 'Cat was successfully updated.'}
        format.json {head :no_content }
      else
        format.html{render action: "edit"}
        format.json {render json: @cat.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @cat = Cat.find_by_id(params[:id])
    @cat.destroy
    respond_to do |format|
      format.html { redirect_to cats_url }
      format.json { head :no_content }
    end
  end


end
