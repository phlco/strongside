class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.find params[:id]
  end

  def new
    @owner = Owner.new
  end

  def create
    owner = Owner.new params[:owner]
    if owner.save
      redirect_to owner
    end
  end

  def edit
    @owner = Owner.find params[:id]
  end

  def update
    @owner = Owner.find params[:id]
    redirect_to @owner
  end

  def destroy
    owner = Owner.find params[:id]
    owner.destroy
    redirect_to owners_path
  end
end