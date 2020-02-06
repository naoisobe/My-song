class HomeController < ApplicationController
  before_action :not_authenticate_user
  
  def index
    @song = Song.find(Like.group(:song_id).order('count(song_id) desc').limit(10).pluck(:song_id))
  end

  def about
  end
end
