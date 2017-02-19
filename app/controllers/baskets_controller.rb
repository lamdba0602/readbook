class BasketsController < ApplicationController
  before_action :authenticate_user!

  def clean
    current_basket.clean!
    flash[:warning] = "已清空漂流瓶"
    redirect_to baskets_path
  end

  def checkout
    @order = Order.new
  end

end
