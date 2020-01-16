class SongsController < ApplicationController
  def index
    @song = Song.all
  end

  def show
    @song = Song.find(params[:id])
    @user = @song.user
    @like = Like.new
    @comment = Comment.new
    @comments = Comment.where(song_id: params[:id])
  end

  def edit
  end

  def my_list
    @song = Song.where(user_id: params[:id])
    @user = User.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.user_id = current_user.id
    if @song.save
      redirect_to song_path(@song)
    else
      render new_song_path
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :description, :thumbnail, :voice)
  end
end
