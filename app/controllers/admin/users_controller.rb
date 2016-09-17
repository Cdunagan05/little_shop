class Admin::UsersController < Admin::BaseController
  def show
    if current_user
      render :show
    end
  end
end
