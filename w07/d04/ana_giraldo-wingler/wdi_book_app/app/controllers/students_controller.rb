class StudentsController < ApplicationController

  def index
    @students = Student.all
    respond_to do |format|
      format.json { render json: @students }
      format.html
    end
  end

  def show
    id = params[:id]
    @student = Student.find(id)
    respond_to do |format|
      format.json do
        render json: @student
      end
    end
  end

  def create
    @student = Student.create(params[:student])
    render json: @student
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    student = Student.find(params[:id])
    student.update_attributes(params[:student])
    redirect_to student
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
    respond_to do |format|
      format.html { redirect_to index.html }
      format.json { render :json => { status: "cool" } }
    end
  end

end