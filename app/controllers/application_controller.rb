class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_i18n_locale_from_params # Локализация rails_admin

  protected
    # Локализация rails_admin
    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash[:notice] = "#{params[:locale]} translation not available"
          logger.error flash[:notice]
        end
      end
    end
end
