class UsersController < ApplicationController
  before_action :create_user_only_when_logged_out, only: [:new, :create]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create_user_only_when_logged_out
    if current_user
      redirect_to tasks_path,  notice: "You can't Register new user when loggged in"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to tasks_path(@user.id)
    else
      render 'new', notice: 'User creation failed.'

    end
  end

  def show
    if current_user
      @user = User.find(params[:id])
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

