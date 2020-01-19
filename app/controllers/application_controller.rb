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

  def get_cart
    current_user.orders.cart.first_or_create
  end

  def pretty_time(time)
    result = time.strftime("%y-%m%d") rescue "-"
  end

  def money(number)
    result =  ActiveSupport::NumberHelper.number_to_delimited(100000) rescue "-"
    "#{result}원"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: User::PARAMETERS)
    devise_parameter_sanitizer.permit(:account_update, keys: User::PARAMETERS)
  end   
end
