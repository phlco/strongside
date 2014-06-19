class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
