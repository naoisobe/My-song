require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "updateアクション" do
    context "他のuserを編集しようとした場合(ログイン時)"

    before do
      @user = FactoryBot.create(:user)
      @other_user = FactoryBot.create(:other_user)
    end

    it "他人のuser情報を更新することができない" do
      user_params = FactoryBot.attributes_for(:user, name: "ChangeName")
      sign_in @user
      patch :update, params: { id: @other_user.id, user: user_params }
      expect(@other_user.reload.name).to eq "testtaro"
    end

    it "投稿一覧ページにリダイレクトする" do
      user_params = FactoryBot.attributes_for(:user)
      sign_in @user
      patch :update, params: { id: @other_user.id, user: user_params }
      expect(response).to redirect_to songs_path
    end
  end

  context "未ログイン時" do

    before do
      @user = FactoryBot.create(:user)
    end

    it "レスポンスのステータスが[302（失敗)」になる" do
      user_params = FactoryBot.attributes_for(:user)
      patch :update, params: { id: @user.id, user: user_params }
      expect(response).to have_http_status "302"
    end

    it "サインイン画面にリダイレクトする" do
      user_params = FactoryBot.attributes_for(:user)
      patch :update, params: { id: @user.id, user: user_params }
      expect(response).to redirect_to new_user_session_path
    end
  end
end
