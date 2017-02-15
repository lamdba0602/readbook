class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def show
    @order = Order.find_by_token(params[:id])
    @book_lists = @order.book_lists
  end


  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = 10

    if @order.save
      current_basket.basket_items.each do |basket_item|
        book_list = BookList.new
        book_list.order = @order
        book_list.book_name = basket_item.book.name
        book_list.book_price = 10
        book_list.quantity = basket_item.quantity
        book_list.save
      end
      redirect_to order_path(@order.token)
    else
      render 'baskets/checkout'
    end
  end

  private

  def order_params
    params.require(:order).permit(:address)
  end
end
