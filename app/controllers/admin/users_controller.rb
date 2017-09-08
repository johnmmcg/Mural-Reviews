class Admin::UsersController < ApplicationController

  def index
    if current_user.admin?
      @users = User.all
      render :index
    else
      flash[:notice] = "You must be an admin to visit that page."
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.save(user_params)
    if @user.save
      flash[:notice] = 'User added successfully'
      redirect_to root_path
    else
      flash[:notice] = @user.errors.full_messages.join(', ')

    end

  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :admin, :profile_photo)
  end

end
