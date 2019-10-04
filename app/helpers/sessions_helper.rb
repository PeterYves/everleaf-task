module SessionsHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
    
   def authorize
     redirect_to new_session_path if current_user.blank?
   end

  def logged_in?
    current_user.present?
  end
end
