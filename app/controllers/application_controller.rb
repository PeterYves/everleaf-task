class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :current_user

  around_action :switch_locale
 
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
