class MachinesController < ApplicationController

  def index
    @machines = Machine.all
  end

  def show
    @machine = Machine.find params[:id]
  end

  def new
    @machine = Machine.new
  end

  def edit
    @machine = Machine.find params[:id]
  end

  def create
    @machine = Machine.new params[:machine]
    if @machine.save
      redirect_to @machine
    else
      render :new
    end
  end

end
