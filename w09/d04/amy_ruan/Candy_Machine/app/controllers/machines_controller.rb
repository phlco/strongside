class MachinesController < ApplicationController
  def index
    @machines = Machine.all
  end

  def show
    @machine = Machine.find(params[:id])
  end

  def new
    @machine = Machine.new
  end

  def edit
    @machine = Machine.find(params[:id])
  end

  def create
    @machine = Machine.new(params[:machine])
    # binding.pry
    if @machine.save
      redirect_to @machine
    else
      render :new
    end
  end

  def update
    machine = Machine.find(params[:id])
    if machine.update_attributes(params[:machine])
      redirect_to machine
    else
      render :edit
    end
  end

  def destroy
    machine = Machine.find(params[:id])
    machine.delete
    redirect_to machines_path
  end
end