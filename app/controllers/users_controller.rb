class UsersController < ApplicationController
  before_action :only_register_when_not_logged_in, only: [:new, :create]
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to tasks_path(@user.id)
    else
      render 'new'
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

  private

  def user_params
    params.require(:user).permit(:name,:email, :password,
                                 :password_confirmation)
  end
end

