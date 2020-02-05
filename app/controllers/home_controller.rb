class HomeController < ApplicationController
  def index
    @song = Song.find(Like.group(:song_id).order('count(song_id) desc').limit(10).pluck(:song_id))
  end

  def about
  end
end
