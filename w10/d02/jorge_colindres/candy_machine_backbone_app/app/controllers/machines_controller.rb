class MachinesController < ApplicationController
  def index
    @machines = Machine.all
    render json: @machines
  end

  def create
    @machine = Machine.new(params[:machine])
    if @machine.save
      render json: @machine
    else
      head :bad_request
    end
  end

  def show
    @machine = Machine.find(params[:id])
    render json: @machine
  end

  def update
    @machine = Machine.find(params[:id])
    @machine.update_attributes(params[:machine])
    if @machine.save
      render json: @machine
    else
      head :bad_request
    end
  end

  def destroy
    @machine = Machine.find(params[:id])
    @machine.destroy
    render nothing: true, status: 200
  end

  def sell
    @machine = Machine.find(params[:id])
    @machine.sell_candy
    if @machine.save
      render json: @machine
    else
      head :bad_request
    end
  end

  def refill
    @machine = Machine.find(params[:id])
    @machine.refill
    if @machine.save
      render json: @machine
    else
      head :bad_request
    end
  end

  def cashout
    @machine = Machine.find(params[:id])
    @machine.cashout
    if @machine.save
      render json: @machine
    else
      head :bad_request
    end
  end
end
