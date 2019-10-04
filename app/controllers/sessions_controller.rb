class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if user.Admin == true
        redirect_to admins_path, notice: "Logged in as admin!"
      else
        redirect_to tasks_path(user.id)
        flash[:notice] = ''
      end      
    else
      flash[:notice] = 'Incorrect Username or Password'
      render 'new'
    end
  end
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'You logged out'
    redirect_to new_session_path
  end
end
