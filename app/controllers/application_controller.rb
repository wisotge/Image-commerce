class ApplicationController < ActionController::Base
  helper_method :cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  def get_cart
     #로그인한 유저의 카트를 가져오고, 없으면 생성
    if current_user
      current_user.orders.cart.first_or_create
    else
      nil
    end
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
