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

  def show
    @user = User.find(params[:id])
  end


  def destroy
    @user = User.find(params[:id])
    @user.murals.destroy_all
    @user.reviews.destroy_all
    @user.destroy

    if @user.destroy
      redirect_to root_url, notice: "User deleted."
    end
  end



  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :admin, :profile_photo)
  end

end
