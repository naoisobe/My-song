class UsersController < ApplicationController
  def index
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to my_path(@user)
    else
      render edit_user_path(@user)
    end
  end

  def my
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :description, :profile_image)
  end
end
