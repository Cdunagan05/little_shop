class Admin::UsersController < Admin::BaseController
  def show
    @orders = Order
    @status = params[:status] || 'all'
    if current_admin?
      render :show
    else
      flash.now[:warning] = 'Encroachment! Admin Dashboard is for admins only!'
      render 'shared/error'
    end
  end
end
