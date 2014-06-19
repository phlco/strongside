class MachinesController < ApplicationController

  def index

    @machines = Machine.all

  end

  def show
    @machine = Machine.find_by_id(params[:id])

  end

  def new
    @machine = Machine.new
  end

  def create
    @machine = Machine.new(params[:machine])
    if @machine.save
      redirect_to @machine
    else
      render :new
    end
  end

  def edit
    @machine = Machine.find_by_id(params[:id])
  end

  def update
    @machine = Machine.find_by_id(params[:id])
    @machine.update_attributes(params[:machine])
    @machine.save
    redirect_to @machine
  end

  def destroy
    @machine = Machine.find_by_id(params[:id])
    Machine.destroy(@machine)
    redirect_to machines_path
  end

end
