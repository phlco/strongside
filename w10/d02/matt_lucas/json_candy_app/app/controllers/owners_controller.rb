class OwnersController < ApplicationController
respond_to :json

  def index
    @owners = Owner.all
    respond_with @owners
  end

  def show
    @owner = Owner.find(params[:id])
    respond_with @owner
  end


end