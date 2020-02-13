class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update]
  before_action :set_user, only: %i[show edit update]
  before_action :self_user, only: %i[edit update]

  def index
  end

  def show
    @relation = Relationship.find_by(user_id: current_user, follow_id: @user.id)
    @new_follow = Relationship.new
  end

  def edit
  end

  def update
    if @user.email == 'test@example.com'
      flash[:notice] = 'テストユーザーのため編集できません'
      render 'edit'
    elsif @user.update(user_params)
        flash[:notice] = 'ユーザー情報が更新されました'
        redirect_to user_path(@user)
    else
        @error = @user
        render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :description, :profile_image)
  end

  def self_user
    redirect_to songs_path unless current_user == @user
  end
end
