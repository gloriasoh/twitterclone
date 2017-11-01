class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
  devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :bio, :country, :birthday, :password, :password_confirmation])

  end

  def after_sign_in_path_for(resource)
  home_path
  end

  def after_sign_out_path_for(resource_or_scope)
  new_user_session_path
  end

end
