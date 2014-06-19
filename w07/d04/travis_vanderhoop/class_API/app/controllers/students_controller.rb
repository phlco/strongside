class StudentsController < ApplicationController
  respond_to :json #sets all actions to respond to .json requests

  def index
    @students = Student.all
    render json: @students
                   #
  end

  def show
    @student = Student.find(params[:id])
    render json: @student
  end

  def create
    @student = Student.create(params['student'])
    redirect_to '/students'                   #
  end

  def update
    @student = Student.update_attributes(params[:student])
  end

  def destroy
    @student = Student.find(params[:id]);
    @student.destroy
  end
end
