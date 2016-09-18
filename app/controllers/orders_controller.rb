class OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders
    else
      render 'shared/error'
    end
  end

  def show
    if current_admin?
      @order = Order.find(params[:id])
    elsif current_user
      @order = current_user.orders.find(params[:id])
    else
      render 'shared/error'
    end
  end
end
