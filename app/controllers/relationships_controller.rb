class RelationshipsController < ApplicationController
  before_action :set_user, only: %i[create destroy]
  def follows
    @user = User.find(params[:id])
    @follow_user = @user.followings
		@follow_user.each do |user|
		  @relation = Relationship.where(user_id: current_user, follow_id: user.id)
		end
		@new_follow = Relationship.new
  end

  def followers
    @user = User.find(params[:id])
    @follower_user = @user.followers
  @follower_user.each do |user|
		@relation = Relationship.where(user_id: current_user, follow_id: user.id)
  end
		@new_follow = Relationship.new
  end

  def create
    following = current_user.follow(user)
    following.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    following = current_user.unfollow(user)
    if following.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def set_user
    user = User.find(params[:relationship][:follow_id])
  end
end
