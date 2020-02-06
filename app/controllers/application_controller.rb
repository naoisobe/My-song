class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name login_id]) # 新規登録時(sign_in時)にnameというキーのパラメーターを追加で許可する
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email login_id]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
  end

  def not_authenticate_user
    redirect_to songs_path if user_signed_in?
  end

  def search
    @q = Song.ransack(params[:q])
    @songs = @q.result(distinct: true)
  end
end
