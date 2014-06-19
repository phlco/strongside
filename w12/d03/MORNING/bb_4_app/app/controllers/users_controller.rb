class UsersController < ApplicationController

  def create
    binding.pry
    user = User.new(user_params)
    if user.save
      render json: {message: 'success'}, status: :created
    else
      render json: {message: 'failure!'}, status: :unauthorized
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
