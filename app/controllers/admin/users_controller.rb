class Admin::UsersController < Admin::BaseController
  def show
    @orders = Order
    if params[:status]
      @status = params[:status]
    else
      @status = 'all'
    end
    render :show
  end
end
