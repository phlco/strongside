class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end
  def show
    owner_id = params[:id]
    @owner = Owner.find(owner_id)
  end
  def new
    @owner = Owner.new
  end
  def edit
    owner_id = params[:id]
    @owner = Owner.find(owner_id)
  end
  def create
    @owner = Owner.new(params[:owner])
    @owner.save
    redirect_to @owner
  end
end
