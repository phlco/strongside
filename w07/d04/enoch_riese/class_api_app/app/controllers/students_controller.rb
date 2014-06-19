class StudentsController < ApplicationController
  respond_to :json, :html
  def index
    @students = Student.all
    respond_with @students
  end
  def create
    @student = Student.new(params[:student])
    @student.save
    respond_with @student
  end
  def update
    id = params[:id]
    @student = Student.find(id)
    @student.update_attributes(params[:student])
    respond_with @student
  end
  def show
    @student = Student.find(params[:id])
    respond_with @student
  end
  def destroy
    @student = Student.find(params[:id])
    @student.delete
    redirect_to "/"
  end
end
