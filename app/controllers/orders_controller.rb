class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_order, only: %i(edit update)

  def new 
    @order = get_cart
  end

  def edit
    @balance = current_user.chocomush - @order.total
    redirect_to edit_user_path(current_user), alert: "잔액이 부족합니다!" if @balance < 0 
  end
  
  def update
    puts 'hi'
    @order.paid! #order.cart의 line_item들을 결제
    @order.update(paid_at: Time.now)
    current_user.set_chocomush("paid", @order.total.to_i)
    redirect_to root_path, notice: "결제가 완료되었습니다."
  end

  private
  def load_order
    @order = Order.find_by(id: params[:id])
  end
end
