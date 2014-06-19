class LambsController < ApplicationController
  def index
    @lambs = Lamb.all
    @lamb = Lamb.new
  end

  def create
    lamb = Lamb.create
    render json: lamb
  end

  def update
    lamb = Lamb.find(params[:id])
    lamb.is_silent = false
    lamb.save
    render json: lamb
  end
end
