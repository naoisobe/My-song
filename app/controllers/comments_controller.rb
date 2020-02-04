class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    @comments = Comment.where(song_id: params[:comment][:song_id])
    @song = Song.find(params[:comment][:song_id])
    @new_comment = Comment.new
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @comments = Comment.where(song_id: params[:comment][:song_id])
    @song = Song.find(params[:comment][:song_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :song_id)
  end
end
