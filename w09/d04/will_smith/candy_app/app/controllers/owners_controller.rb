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
      if @owner.save
        redirect_to @owner
      else
        render :new
      end
  end

  def update
   owner_id = params[:id]
   @owner = Owner.find(owner_id)

    if @owner.update_attributes(params[:owner])
      redirect_to @owner
    else
      render :update
    end
  end

  def destroy
   owner_id = params[:id]
   @owner = Owner.find(owner_id)
   @owner.destroy
   redirect_to :index
  end

end
