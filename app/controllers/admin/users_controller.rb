class Admin::UsersController < Admin::BaseController
  def show
    @orders = Order
    @status = params[:status] || 'all'
    render :show
  end
end
