class PracticesController < ApplicationController
  def index
    @practice = Practice.all
  end

  def show
    @practice = Practice.find(params[:id])
    @user = @practice.user
  end

  def edit
  end

  def my_list
    @practice = Practice.where(user_id: params[:id])
    @user = User.find(params[:id])
  end

  def new
    @practice = Practice.new
  end

  def create
    @practice = Practice.new(practice_params)
    @practice.user_id = current_user.id
    if @practice.save
      redirect_to practice_path(@practice)
    else
      render new_song_path
    end
  end

  private
  def practice_params
    params.require(:practice).permit(:title,:description,:video)
  end
end
