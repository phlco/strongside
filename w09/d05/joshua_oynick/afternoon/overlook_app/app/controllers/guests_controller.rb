class GuestsController < ApplicationController

  def create
    @guest = Guest.create(params[:guest])
    render :json => @guest
  end
end
