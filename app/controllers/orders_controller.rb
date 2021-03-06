class OrdersController < ApplicationController
  def create
    order = current_user.orders.new
    order.subtotal_order_items(@cart.item_quantities)
    if order.save
      session.delete(:cart)
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
      flash.now[:warning] = 'Must be logged in to view orders'
      render 'shared/error'
    end
  end

  def show
    @order = Order.find(params[:id])
    if !current_user
      flash.now[:warning] = 'Must be logged in to view orders'
      render 'shared/error'
    elsif current_admin? || current_user == @order.user

    else
      flash.now[:warning] = 'Users can only view their own orders'
      render 'shared/error'
    end
  end
end
