class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  check_authorization :unless => :devise_controller?

  helper_method :current_admin?
  

  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] = 'Restricted'
    redirect_to root_url
  end


  private

  def do_not_check_authorization?
    respond_to?(:devise_controller?)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :first_name, :last_name, :admin, :beta) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :current_password, :first_name, :last_name, :admin, :beta) }
  end

  def current_admin?
    current_user and current_user.admin?
  end
end
