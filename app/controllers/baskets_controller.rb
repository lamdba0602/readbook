class BasketsController < ApplicationController

  def clean
    current_basket.clean!
    flash[:warning] = "已清空漂流瓶"
    redirect_to baskets_path
  end

end
