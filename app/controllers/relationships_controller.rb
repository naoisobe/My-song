class RelationshipsController < ApplicationController
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
    @user = User.find(params[:relationship][:follow_id])
    following = current_user.follow(@user)
    following.save
    @relation = Relationship.find_by(user_id: current_user, follow_id: @user.id)
    @new_follow = Relationship.new
  end

  def destroy
    @user = User.find(params[:relationship][:follow_id])
    following = current_user.unfollow(@user)
    following.destroy
    @new_follow = Relationship.new
  end
end
