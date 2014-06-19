class StudentsController < ApplicationController

  def new
    @student = Student.new

    respond_to do |format|
      format.html
      format.json { render json: {name: nil, email: nil, image_url: nil} }
    end
  end

  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @student }
    end
  end

  def index
    @students = Student.all

    respond_to do |format|
      format.html
      format.json { render json: @students }
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end

end
