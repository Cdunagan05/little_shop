class Admin::UsersController < Admin::BaseController
  def show
    render :show if current_user
  end
end
