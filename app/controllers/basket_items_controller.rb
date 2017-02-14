class BasketItemsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @basket = current_basket
    @basket_item = @basket.basket_items.find_by(id: params[:id])
    @book = @basket_item.book
    @basket_item.destroy

    flash[:warning] = "成功将 #{@book.name} 从购物车删除!"
    redirect_to :back
  end

end
