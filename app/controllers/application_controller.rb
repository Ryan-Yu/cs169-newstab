class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  # Need to whitelist all parameters on a 'create' action of User Controller
  # TODO: Add birthday, etc.
  def configure_permitted_parameters
    registration_params = [:first_name, :last_name, :email, :password, :password_confirmation]
    
    if params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
end
