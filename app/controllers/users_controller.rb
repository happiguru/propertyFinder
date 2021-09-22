class UsersController < ApplicationController
  def index
    @users = User.all
    if @users
      render json: @users
    else
      render json: {
        status: 500,
        errors: ['User not found!']
      }
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: @user
    else
      render json: {
        status: 500,
        errors: ['User not found']
      }
    end
  end

  def create
    @user = User.new(params[user_params])
    if @user.save
      login!
      render json: {
        status: created,
        user: @user
      }
    else
      render json: {
        status: 500,
        errors: @user.errors.full_messages
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
