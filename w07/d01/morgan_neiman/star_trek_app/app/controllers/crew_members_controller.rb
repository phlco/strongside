class CrewMembersController < ApplicationController

  def index
    @crew_members = CrewMember.select("name, id")
    render :json => @crew_members
  end

  def show
    @crew_member = CrewMember.find(params[:id])
    render :json => @crew_member
  end

  def create
    @crew_member = CrewMember.new(params[:crew_member])
    render :json => @crew_member
  end

  def update
    @crew_member = CrewMember.find(params[:id])
    render :json => @crew_member
  end

  def destroy
    @crew_member = CrewMember.find(params[:id])
    render :json => @crew_member
  end

end
