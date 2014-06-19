class StudentsController < ApplicationController


  def index
    @students = Student.all

    respond_to do |format|
      format.html
      format.json {render json: @cats}
    end
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new params[:student]

    respond_to do |format|
      if @student.save
        format.html {redirect_to @student}
        format.json {render json: @student, status: :created, location: @student}
      else
        format.html {render :new, flash[:error] = "This student was not saved to the database."}
        format.json {render json @student.errors, status: :unprocessable_entity}
      end
    end
  end

  def show
    @student = Student.find params[:id]

    respond_to do |format|
      format.json do
        render json: @student
      end
      format.html
    end
  end

  def edit
    @student = Student.find params[:id]
  end

  def update
    student = Student.find params[:id]
    student.update_attributes params[:student]
  end

  def destroy
    Student.find(params[:id]).destroy
  end

end
