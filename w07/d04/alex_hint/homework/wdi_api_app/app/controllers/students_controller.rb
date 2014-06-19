class StudentsController < ApplicationController

  def index
    @students = Student.all
    respond_to do |format|
      format.json { render json: @students}
    end
  end

  def new
    @student = Student.new

    respond_to do |format|
      format.json { render json: {name: nil, image_url: nil, email: nil} }
    end
  end

  def create
    @student = Student.create(params[:student])
      respond_to do |format|
        if @student.save
          format.json { render json: @student, status: :created, location: @student }
        else
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
  end

  def show
    @student = Student.find_by_id(params[:id])
    respond_to do |format|
      format.json { render json: @student }
    end
  end

  def edit
    @student = Student.find_by_id(params[:id])
  end

  def update
    @student = Student.find_by_id(params[:id])
    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.json { head :no_content }
      else
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student = Cat.find_by_id(params[:id])
    @student.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

end















