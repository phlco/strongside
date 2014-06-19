class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.find( params[:id] )
  end

  def new
    @owner = Owner.new
  end

  def edit
    @owner = Owner.find params[:id]
  end

  def create
    @owner = Owner.new params[:owner]
    if @owner.save
      redirect_to @owner
    else
      render :new
    end
  end

  def update
    @owner = Owner.find( params[:id] )
    if @owner.update_attributes( params[:owner] )
      redirect_to @owner
    else
      redirect_to edit_owner_path
    end
  end

  def destroy
    Owner.destroy( params[:id] )
    redirect_to owner_path
  end
end