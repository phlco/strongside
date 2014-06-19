class UsersController < ApplicationController
  def index
    render json: User.all
  end
  def new
    @user = User.new
    respond_to do |format|
      format.html {}  # new.html.erb
      format.js {}  # new.js.erb
      format.json { render json: {status: 200, message: 'hello'}}
    end
  end
end
