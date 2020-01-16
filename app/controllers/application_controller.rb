class ApplicationController < ActionController::Base
  helper_method :cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  def cart
    if current_user
      current_user.orders.find_or_create_by(status: :cart)
    else
      nil
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: User::PARAMETERS)
    devise_parameter_sanitizer.permit(:account_update, keys: User::PARAMETERS)
  end   
end
