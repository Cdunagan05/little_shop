class OrdersController < ApplicationController
  def create
    order = current_user.orders.new
    order.subtotal_order_items(@cart.item_quantities)
    if order.save
      flash[:success] = 'Order was successfully placed'
      redirect_to orders_path
    else
      redirect_back(fallback_location: cart_path)
    end
  end

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
