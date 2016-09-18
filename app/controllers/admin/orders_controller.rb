class Admin::OrdersController <Admin::BaseController
  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(order_params)
      redirect_back(fallback_location: admin_dashboard_path)
    else
      flash[:error] = "Failed to update Order #{order.id}"
      redirect_to order_path(@order)
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
