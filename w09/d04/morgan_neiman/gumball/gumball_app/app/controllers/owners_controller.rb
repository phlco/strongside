class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end
  def show
    id = params[:id].to_i
    @owner = Owner.where(id: id).first
  end
  def new
    @owner = Owner.new
  end
  def edit
    id = params[:id].to_i
    @owner = Owner.where(id: id).first
  end
  def create
    owner_params = params[:user]
    @owner = Owner.new
    @owner.money = params[:user][:money]
    @owner.candy = params[:user][:candy]

    if @owner.save
      redirect_to "/owners/#{@owner.id}"
    else
      render :new
    end

  end
  def update
    id = params[:id].to_i
    @owner = Owner.where(id: id).first
    @owner.candy = params[:owner][:candy]
    @owner.money = params[:owner][:money]
    # binding.pry
    redirect_to "/owners/#{@owner.id}"

  end
  def destroy
    id = params[:id].to_i
    @owner = Owner.where(id: id).first
    @owner.destroy

    redirect_to "/owners"
  end

end