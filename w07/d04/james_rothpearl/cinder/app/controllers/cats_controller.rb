class CatsController < ApplicationController

  def index
    @cat = Cat.all
  end

  def new
    @cat = Cat.new
    #load form
  end

  def create
    @cat = Cat.new(params[:cat])

    if @cat.save
      redirect_to '/cats', notice: 'You created a kitt3n hax0r'
    else
      notice: 'Cat not successfully created'
    end
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])

    if @cat.update_attributes(params[:cat])
      redirect_to '/cats', notice: 'Cat successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy

    redirect_to '/cats'
  end
end



