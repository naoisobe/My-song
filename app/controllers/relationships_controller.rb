class RelationshipsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_user, only: %i[follows followers]
  before_action :set_new_follow

  def follows
    @follow_user = @user.followings
    @follow_user.each do |user|
      @relation = Relationship.where(user_id: current_user, follow_id: user.id)
    end
  end

  def followers
    @follower_user = @user.followers
    @follower_user.each do |user|
      @relation = Relationship.where(user_id: current_user, follow_id: user.id)
    end
  end

  def create
    @user = User.find(params[:relationship][:follow_id])
    following = current_user.follow(@user)
    following.save
    @relation = Relationship.find_by(user_id: current_user, follow_id: @user.id)
  end

  def destroy
    @user = User.find(params[:relationship][:follow_id])
    following = current_user.unfollow(@user)
    following.destroy
  end
end
