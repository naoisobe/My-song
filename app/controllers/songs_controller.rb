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
  end

  private
  def song_params
    params.require.(:song).permit(:title, :description, :thumbnail, :voice)
  end
end
