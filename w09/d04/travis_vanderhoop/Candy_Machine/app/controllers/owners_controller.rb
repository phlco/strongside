class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def create
    @owner = Owner.new(params[:owner])
    binding.pry
    if @owner.save
      redirect_to @owner
    else
      render :edit
    end
  end

  # def new
  # end

  # def edit
  # end

  # def update
  # end

  # def destroy

  # end
end
