
class UsersController < ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.json {render json: @users}
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.json {render json: @user}
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json:@user}
    end
  end

  def create
    @user = User.new(params["@user"])
    respond_to do |format|
      if @user.save
        format.html do
          redirect_to @user
          flash[:notice] = 'User created'
        end
        format.json{render json:@user, status: :created}
      else
        format.html do
          render action:"new"
          flash[:error] = "User not created"
        end
        format.json{render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:@user])
        format.html {redirect_to @user, notice: 'User updated'}
        format.json {render json: @user}
      else
        format.html {render action: "edit"}
        format.json {render json: @user.errors, status: unprocessable_entity}
      end
    end
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    # respond_to do |format|
    #   format.html {redirect_to users_path}
    #   format.json {redirect_to users_path}
    # end
  end

end