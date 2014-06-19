class StudentsController < ApplicationController

  def index
    @students = Student.all
    respond_to do |format|
      format.json { render json: @students }
    end
  end

  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.json { render json: @student, status: :created, location: @student }
      else
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.json { head :no_content }
      else
        format.json { reder json: @student.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end
end