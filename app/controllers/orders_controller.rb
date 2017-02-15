class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = 10

    if @order.save
      redirect_to order_path(@order)
    else
      render 'baskets/checkout'
    end
  end

  private

  def order_params
    params.require(:order).permit(:address)
  end
end
