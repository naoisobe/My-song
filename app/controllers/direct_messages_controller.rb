class DirectMessagesController < ApplicationController
  def create
    @message = DirectMessage.new(message_params)
    @room = Room.find(params[:room_id])
    @message.room_id = @room.id
    if user_signed_in?
      @message.user_id = current_user.id
    elsif instructor_signed_in?
      @message.instructor_id = current_instructor.id
    end
      @message.save
  end

  def new
  end 

  def destroy
  end

  private

  def message_params
    params.require(:direct_message).permit(:message)
  end
end
