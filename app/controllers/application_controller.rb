# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_author!, unless: :allowed_access
  before_action :configure_permitted_parameters, if: :devise_controller?

  def allowed_access
    current_author
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Author)
      posts_path
    else
      super
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[nickname email password password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[nickname email password current_password
                                               password_confirmation])
  end
end
