class UsersController < ApplicationController
    before_action :authenticate_user!, only: %i{edit}

  def index
  end

  def show
    @user = User.find(params[:id])
    @relation = Relationship.find_by(user_id: current_user, follow_id: @user.id)
    @new_follow = Relationship.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報が更新されました"
      redirect_to user_path(@user)
    else
      @error = @user
      render edit_user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :description, :profile_image)
  end
end
