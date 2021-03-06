class StudentsController < ApplicationController
  # GET /students
  # GET /students.json
  def index
    @students = Student.all.sort

    render json: @students
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])

    render json: @student
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])

    if @student.save
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    if @student.update_attributes(params[:student])
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    head :no_content
  end
end
