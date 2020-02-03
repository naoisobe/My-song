class AdviseChatController < ApplicationController
  def create
    @message = AdviseChat.new(advise_params)
    @message.user_id = current_user.id if user_signed_in?
    @message.instructor_id = current_instructor.id if instructor_signed_in?
    @message.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
  end

  private

  def advise_params
    params.require(:advise_chat).permit(:practice_id, :message)
  end
end
