class StudentsController < ApplicationController

  def index
    @students = Student.all
    respond_to do |format|
      format.json { render json: @students }
    end
  end

  def new
    @new_student = {
      email: nil,
      img_url: nil,
      name: nil
      }
    respond_to do |format|
      format.json { render json: @new_student }
    end
  end

  def create
    @new_student = Student.create(params[:student])
    respond_to do |format|
      if @new_student.save
          format.json { render json: @new_student, status: :created, location: @student }
          #what does this do?? status? location?
      else
        format.json { render json: @new_student.errors, status: :unprocessable_entity }
        #I'm not sure how this works, would like some clarification
      end
    end
  end

  def show
    @student = Student.find_by_id(params[:id])
    respond_to do |format|
      format.json {render json: @student}
    end
  end

  def edit
    @student = Student.find_by_id(params[:id])
    respond_to do |format|
      format.json { render json: @student }
    end
  end

  def update
    @student = Student.find_by_id(params[:id])
    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.json {redirect_to @student, notice: "Student successfully updated"}
      else
        format.json {render action: "edit"}
        #I don't know what this does either
      end
    end
  end

  def destroy
    @student = Student.find_by_id(params[:id])
    @student.destroy
    respond_to do |format|
      format.json {redirect_to cats_url}
      #not sure this works
    end
  end


end
