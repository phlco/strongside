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
    @owner = Owner.new(params[:owner])
    if @owner.save
      redirect_to @owner
    else
      render :new
    end
  end

  # def update
  #   @owner = Owner.find(params[:id])
  #   if @owner.save
  #     redirect_to @owner
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @owner = Owner.find(params[:id])
    @owner.destroy
  end
end
