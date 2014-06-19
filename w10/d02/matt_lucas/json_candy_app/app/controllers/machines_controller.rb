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
    @machine = Machine.find(params[:id])
    # find by params
    @machine.fill_candy
    # add candy to machine
    respond_with @machine
    # update db
    # send json response with updated info
  end

  def sell_candy
    @machine = Machine.find(params[:id])
    # find by params
    @machine.sell_candy
    # subtract candy from machine
    # add appropriate money to machine
    # update db
    respond_with @sell_candy
    # send back the json
  end

  def get_money
    @machine = Machine.find(params[:id])
    # find by params
    @machine.get_money
    # subtract total $$$ from machine
    # add total to Owners bank account
    # save owner
    # save machine
    respond_with @machine
    # send both via json
  end

end