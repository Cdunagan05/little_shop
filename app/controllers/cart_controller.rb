class CartController < ApplicationController
  before_action :set_cart
  def index
  end

  def update
    @cart.increase_quantity(params[:cart_items][:item_id], params[:cart_items][:quantity])
    session[:cart] = @cart.contents
    redirect_back(fallback_location: cart_path)
  end

  private

  def set_cart
    @cart = Cart.new(session[:cart])
  end
end
