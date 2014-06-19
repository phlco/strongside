class GuestsController < ApplicationController
  def new
    @guest = Guest.new
  end
  def create
    render json: Guest.create(params[:guest])
  end
end
