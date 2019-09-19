class ApplicationController < ActionController::Base
    around_action :switch_locale
 
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def self.search(term)
    if term
      where('status LIKE ?', "%#{term}%").order('id DESC')
      where('priority LIKE ?', "%#{term}%").order('id DESC')
    else
      order('id DESC')
    end
  end
end
