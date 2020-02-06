class AdviseChatController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_instructor!
  
  def create
    @message = AdviseChat.new(advise_params)
    @message.user_id = current_user.id if user_signed_in?
    @message.instructor_id = current_instructor.id if instructor_signed_in?
    @message.save
    @practice = Practice.find(params[:advise_chat][:practice_id])
  end

  def destroy
    @message = AdviseChat.find(params[:id])
    @message.destroy
  end

  private

  def advise_params
    params.require(:advise_chat).permit(:practice_id, :message)
  end
end
