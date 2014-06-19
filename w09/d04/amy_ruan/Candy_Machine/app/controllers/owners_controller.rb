class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def new
    @owner = Owner.new
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def create
    owner = Owner.new(params[:owner])
    if owner.save
      redirect_to owner
    else
      render :new
    end
  end

  def update
    owner = Owner.find(params[:id])
    if owner.update_attributes(params[:owner])
      redirect_to owner
    else
      render :edit
    end
  end

  def destroy
    owner = Owner.find(params[:id])
    owner.delete
    redirect_to owners_path
  end
end