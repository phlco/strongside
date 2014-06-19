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

  def update
    @machine = Machine.find params[:id]
    if @machine.update_attributes(params[:machine])
      redirect_to machine_path
    else
      render :edit
    end
  end
end
