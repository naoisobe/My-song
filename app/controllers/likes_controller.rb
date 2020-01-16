class LikesController < ApplicationController
  def create
    @like = Like.new(song_id: params[:like][:song_id], user_id: current_user.id)
    @like.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(song_id: params[:id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
