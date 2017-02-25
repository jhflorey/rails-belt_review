class UsersController < ApplicationController
  def index
    # @users = User.all

  end

  def new
  end

  def show
  end

  def create
    user = User.create(name: params[name], alias: params[:alias], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.valid?
      session[:user_id] = user[:id]
      redirect_to '/show'
    else
      render json: user.errors
    end
  end

  def login
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user[:id]
      redirect_to '/show'
    else
      render text: "Something was wrong with login credentials"
    end

  end
  private

  def check_status

    if !session[:user_id]
      redirect_to '/'
    end
  end
 

  def update
  end
end
