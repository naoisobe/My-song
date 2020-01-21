class LikesController < ApplicationController
  def create
    @like = Like.create(song_id: params[:id], user_id: current_user.id)
    @song = Song.find(params[:id])
    @like = Like.new
  end

  def destroy
    @like = Like.find_by(song_id: params[:id], user_id: current_user.id)
    @like.destroy
    @song = Song.find(params[:id])
    @like = Like.new
  end
end
