class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 
  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "You are not admin"
    end
  end

  helper_method :current_basket

  def current_basket
    @current_basket ||= find_basket
  end

  private

  def find_basket
    basket = Basket.find_by(id: session[:basket_id])
    if basket.blank?
      basket = Basket.create
    end

    session[:basket_id] = basket.id
    return basket
  end
end
