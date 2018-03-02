class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: {error: "Could not create user account!"}
    end
  end

  protected

  def user_params
    params.require(:user).permit(:handle, :password, :password_confirmation)
  end

end
