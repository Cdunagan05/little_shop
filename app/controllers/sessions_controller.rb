class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if authenticated_user?(@user) && current_admin?
        redirect_to admin_dashboard_path
    elsif authenticated_user?(@user)
        redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def authenticated_user?(user)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
    end
  end
end
