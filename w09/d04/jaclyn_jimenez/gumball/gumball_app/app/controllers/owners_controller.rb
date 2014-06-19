class OwnersController < ApplicationController

  def index

    @owners = Owner.all

  end

  def show
    @owner = Owner.find_by_id(params[:id])

  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(params[:owner])
    if @owner.save
      redirect_to @owner
    else
      render :new
    end
  end

  def edit
    @owner = Owner.find_by_id(params[:id])
  end

  def update
    @owner = Owner.find_by_id(params[:id])
    @owner.update_attributes(params[:owner])
    @owner.save
    redirect_to @owner
  end

  def destroy
    @owner = Owner.find_by_id(params[:id])
    Owner.destroy(@owner)
    redirect_to owner_path
  end

end
