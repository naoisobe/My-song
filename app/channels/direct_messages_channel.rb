class DirectMessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_for "room_#{params[:room_id]}"
    end 

  def speak(data)
  message = DirectMessage.create(room_id: data['room_id'], message: data['message'], ( user_id: data['user_id'] && instructor_id: data['instructor_id']))
  DirectMessagesChannel.broadcast_to "room_#{data['room_id']}", content: render_message(message)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  private
  def render_message(message)
    ApplicationController.renderer.render(partial: 'direct_messages/direct_messages', locals: { dm: dm })
  end
end
