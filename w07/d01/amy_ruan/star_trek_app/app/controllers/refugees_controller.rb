class RefugeesController < ApplicationController
  respond_to :json
  def index
    @refugees = Refugee.select("name, id")
    respond_with @refugees
  end

  def show
    @refugee = Refugee.find(params[:id])
    respond_with @refugee
  end

  def new
    @refugee = Refugee.new
  end

  def create
    @refugee = Refugee.create(params[:refugee])
    respond_with @refugee
  end

  def update
    @refugee = Refugee.find(params[:id])
    respond_with @refugee
  end

  def destroy
    @refugee = Refugee.find(params[:id])
    respond_with @refugee
  end

end
