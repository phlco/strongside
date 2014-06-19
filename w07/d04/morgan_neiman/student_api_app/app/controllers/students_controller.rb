class StudentsController < ApplicationController
  respond_to :json, :html
  def index
    @students = Student.all
    respond_with @students
  end
  def show
    id = params[:id].to_i
    @student = Student.where(id: id)
    respond_with @student
  end
  def create
    @student = Student.new
    @student.name = params[:name]
    @student.email = params[:email]
    @student.image_url = params[:image_url]
    @student.save
    # @student = student
    respond_with @student
  end
  def update
    id = params[:id]
    @student = Student.where(id: id).first
    @student.name = params[:name]
    @student.email = params[:email]
    @student.image_url = params[:image_url]
    @student.save
    render :json => @student
  end

end