require 'jwt'
class Api::V1::UsersController < ApplicationController
  # before_action :set_user, only: %i[create]
  # skip_before_action :authorize_request, only: [:index]
  before_action :authorized, only: [:auto_login]

  def index
    @welcome = 'Hello, This is the Backend!'
    render json: @welcome

    # render json: User.all
  end

  def create
    return render json: @user, status: :ok if @user

    @user = User.new(user_params)

    # if @user.save
    #   payload = { user_id: @user.id, email: @user.email }
    #   token = encoded_token(payload)
    # render json: { data: @user, status: "User created", jwt: token }

    # else
    #   render json: { errors: @user.errors }, status: :unprocessable_entity
    # end

    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  def show
    @user = User.find(params[:id])
    return render json: @user, status: :ok if @user
  end

  def favourite
    @user = User.find_by(id: favourite_params[:user_id])
    @house = House.find_by(id: favourite_params[:house_id])
    @favourite = Favourite.create!(favourite_params)
    render json: @favourite, status: :created
  end

  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end


  def auto_login
    render json: @user
  end

  private

  # def set_user
  #   @user = User.find_by(email: params[:email])
  # end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def favourite_params
    params.permit(:house_id, :user_id)
  end

  # def encoded_token(payload={})
  #   exp = 72.hours.from_now
  #   payload[:exp] = exp.to_i
  #   JWT.encode(payload, ENV['SECRET_KEY_BASE'])
  # end
end
