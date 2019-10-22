class Admin::UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :only_admin_view_other_users, only: [:index]
    def index
      @users = User.all
    end
    def admin
      @users = User.all
    end
  
    def show
    end
  
    def new
      @user = User.new
    end
  
    def edit
    end
  
    def create
        @user = User.new(user_params)
  
        if @user.save
          redirect_to tasks_url, notice: 'User was successfully created.'
        else
          render :new
        end
    end

    def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      if @user.id == current_user.id
        redirect_to admin_users_url, notice: "You can not delete signed in user"
        @admins = User.admins
      elsif @admins == 1
        redirect_to admin_users_url, notice: "At least one admin must remain!"
      else
        @user.destroy
        redirect_to admin_users_url, notice: 'User was successfully destroyed.'
      end
    end

    private
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:name, :email, :user_type, :password, :password_confirmation)
    end

    def i_am_still_here
        current_user.update(last_seen_at:DateTime.now)
    end  
  
    def only_admin_view_other_users
      unless current_user && current_user.user_type == "admin"
        redirect_to root_url, notice: "only admin user can access this page"
      end
    end
  end
  