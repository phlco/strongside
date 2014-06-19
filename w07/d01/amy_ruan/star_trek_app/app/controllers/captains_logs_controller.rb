class CaptainsLogsController < ApplicationController
respond_to :json
  def index
    @captainlogs = CaptainLog.all
    respond_with @crew_members
  end

  def show
    @captainlog = CaptainLog.find(params[:id])
  end

  def create
    @captainlog = CaptainLog.new(params[:crew_member])
  end

  def update
    @captainlog = CaptainLog.find(params[:id])
  end

  def destroy
    @captainlog = CaptainLog.find(params[:id])
  end



end
