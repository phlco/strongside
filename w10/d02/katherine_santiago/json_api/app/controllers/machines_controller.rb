class MachinesController < ApplicationController
respond_to :json

  def index
    respond_with Machine.all
  end

  def show
    respond_with Machine.find(params[:id])
  end

  def create
    respond_with Machine.create(params[:machine])
  end

  def update
    respond_with Machine.update(params[:id], params[:machine])
  end

  def destroy
    respond_with Machine.destroy(params[:id])
  end

  def fill_machine
    # find the machine
    # add candy to the machine
    # update the database
    # send json response with updated info
    @machine = Machine.find(params[:id])
    @machine.fill
    respond_with @machine
  end

  def sell_candy
    # find the machine
    # subtract candy from machine
    # add money to the machine
    # update the database
    # send json response with updated info
    @machine = Machine.find(params[:id])
    @machine.sell_candy
    respond_with @machine
  end

  def get_money
    # find the machine
    # subtract all money from the machine
    # add the money to the owner's total moneys
    # update the database
    # send json response with updated info
    @machine = Machine.find(params[:id])
    @machine.get_money
    respond_with @machine
  end

end
