class StudentsController < ApplicationController

  def index
      @students = Student.all
      respond_to do |format|
        format.html
        format.json do
          render json: @students
        end
      end
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params[:student])
    @student.save
        respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end

  end

  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { render json: {success: true} }
    end

  end


end