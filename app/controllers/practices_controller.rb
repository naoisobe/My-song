class PracticesController < ApplicationController
  before_action :authenticate_user! 

  def index
    @practice = Practice.all
  end

  def show
    @practice = Practice.find(params[:id])
    @user = @practice.user
    @like = Like.new
    @comment = Comment.new
    @comments = Comment.where(song_id: params[:id])
    @relation = Relationship.find_by(user_id: current_user, follow_id: @user.id)
    @new_follow = Relationship.new
    @message = AdviseChat.new
    @messages = AdviseChat.where(practice_id: params[:id])
  end

  def edit
    @practice = Practice.find(params[:id])
  end

  def my_list
    @practices = Practice.where(user_id: params[:id])
    @user = User.find(params[:id])
    @relation = Relationship.find_by(user_id: current_user, follow_id: @user.id)
    @new_follow = Relationship.new
  end

  def new
    @practice = Practice.new
  end

  def create
    @practice = Practice.new(practice_params)
    @practice.user_id = current_user.id
    if @practice.save
      flash[:notice] = "投稿されました"
      redirect_to practice_path(@practice)
    else
      @error = @practice
      render new_practice_path
    end
  end

  def destroy
    @practice = Practice.find(params[:id])
    @practice.destroy
    flash[:notice] = "投稿が削除されました"
    redirect_to songs_path
  end

  def update
    @practice = Practice.find(params[:id])
    @practice.update(practice_params)
    flash[:notice] = "投稿を編集しました"
    redirect_to practice_path(@practice)
  end

  private

  def practice_params
    params.require(:practice).permit(:title, :description, :video)
  end
end
