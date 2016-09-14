class CartController < ApplicationController
  def index
    
    @cart = Cart.new(session[:cart])

  end
end
