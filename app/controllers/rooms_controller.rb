class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @message = DirectMessage.new
    @dm = DirectMessage.where(room_id: params[:id])
  end

  def create
    @room = Room.new(practice_id: params[:room][:practice_id])
    @message = DirectMessage.new
    if instructor_signed_in?
      @room.instructor_id = current_instructor.id
    elsif user_signed_in?
      @room.user_id = current_user.id
    end
    @room.save
    redirect_to room_path(@room.id)
  end

  def update
    @room = Room.find(practice_id: [:room][:practive_id])
    if user_signed_in?
      @room.user_id = current_user.id
    elsif instructor_signed_in?
      @room.instructor_id = current_instructor.id
    end
    @room.update
    redirect_to room_path(room)
  end
end
