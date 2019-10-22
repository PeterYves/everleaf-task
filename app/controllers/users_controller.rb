class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #before_action :only_register_when_not_logged_in, only: [:new, :create]
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if !current_user
      session[:user_id] = @user.id
      redirect_to tasks_path(@user.id),notice: 'acccount created and you are in.'
      elsif current_user
        redirect_to admin_users_path, notice: 'User was successfully created.'
      else
      render 'new'
      end
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end


  def only_register_when_not_logged_in
    if current_user
      redirect_to tasks_path,  notice: "You can't Register New user when Logged in"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def admin
    @users = User.all
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,:email,:user_type, :password,
                                 :password_confirmation)
  end
end

