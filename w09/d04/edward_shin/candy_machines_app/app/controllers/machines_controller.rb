class MachinesController < ApplicationController

  def index
    @machines = Machine.all
  end

  def show
    machine_id = params[:id]
    @machine = Machine.find(machine_id)
  end

  def new
    @machine = Machine.new
  end

  def edit
    machine_id = params[:id]
    @machine = Machine.find(machine_id)
  end

  def create
    @machine = Machine.new(params[:machine])
    if @machine.save
      redirect_to @machine
      else
        render :new
    end
  end

  def update
    @machine = Machine.find(params[:id])
    redirect_to(@machine)
  end

end