class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    if !current_user
      flash[:warning] = 'Must be logged in to edit your profile'
      redirect_to login_path
    elsif @user == current_user

    else
      flash.now[:warning] = 'Users can only edit their own profile'
      render 'shared/error'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def show
    if !current_user
      flash[:warning] = 'Must log in to view dashboard'
      redirect_to login_path
    elsif @user == current_user || current_admin?
      render :show
    else
      flash.now[:warning] = 'Users can only view their own dashboard'
      render 'shared/error'
    end
    #
    # if @user == current_user
    #   render :show
    # if current_user
    #   flash[:warning] = 'Users can only view their own dashboard'
    #   redirect_to 'shared/error'
    # else
    #   flash[:warning] = 'Must log in to view dashboard'
    #   redirect_to login_path
    # end
  end

  private

  def user_params
    params.require(:user).permit(:username,
                                 :name,
                                 :address,
                                 :password,
                                 :password_confirmation
                                )
  end

  def set_user
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end
end
