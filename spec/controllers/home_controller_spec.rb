require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "indexアクション" do
    context "ログイン状態" do
      before do
        @user = FactoryBot.create(:user)
      end
      it "レスポンスのステータスが[302（失敗)」になる" do
        sign_in @user
        get :index
        expect(response).to have_http_status "302"
      end

      it "rootパスにアクセスすると投稿一覧にリダレクトする" do
        sign_in @user
        get :index
        expect(response).to redirect_to songs_path
      end
    end
  end
end
