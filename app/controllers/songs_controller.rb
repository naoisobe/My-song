class SongsController < ApplicationController
  def index
  end

  def show
  end

  def edit
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
