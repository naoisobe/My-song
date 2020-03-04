require 'rails_helper'

RSpec.describe SongsController, type: :controller do

  describe "newアクション" do
    context "未ログイン時" do

      it "レスポンスのステータスが[302（失敗)」になる" do
        get :new
        expect(response).to have_http_status "302"
      end

      it "サインインページに遷移する" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "createアクション" do
    context "未ログイン時" do

      it "レスポンスのステータスが[302（失敗)」になる" do
        song_params = FactoryBot.attributes_for(:song)
        post :create, params: { song: song_params }
        expect(response).to have_http_status "302"
      end

      it "サインインページに遷移する" do
        song_params = FactoryBot.attributes_for(:song)
        post :create, params: { song: song_params }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "updateアクション" do
    context "他人のsongの投稿を更新しようとした場合(ログイン時)" do
    
      before do
        @user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:other_user)
        @song = FactoryBot.create(:song, user: other_user, title: "Same Title")
      end

      it "投稿一覧ページにリダイレクトする" do
        song_params = FactoryBot.attributes_for(:song)
        sign_in @user
        patch :update, params: { id: @song.id, song: song_params }
        expect(response).to redirect_to songs_path
      end
    end

    context "未ログイン時" do

      before do
        @song = FactoryBot.create(:song)
      end

      it "レスポンスのステータスが[302（失敗)」になる" do
        song_params = FactoryBot.attributes_for(:song)
        patch :update, params: { id: @song.id, song: song_params }
        expect(response).to have_http_status "302"
      end

      it "サインイン画面にリダイレクトする" do
        song_params = FactoryBot.attributes_for(:song)
        patch :update, params: { id: @song.id, song: song_params }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "destroyアクション" do
    context "他人のsongの投稿を削除しようとした場合(ログイン時)" do
    
      before do
        @user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:other_user)
        @song = FactoryBot.create(:song, user: other_user )
      end

      it "投稿を削除できない" do
        sign_in @user
        expect {
          delete :destroy, params: { id: @song.id }    
        }.to_not change(Song, :count)
      end

      it "投稿一覧ページにリダイレクトする" do
        sign_in @user
        delete :destroy, params: { id: @song.id}
        expect(response).to redirect_to songs_path
      end
    end

    context "未ログイン時" do

      before do
        @song = FactoryBot.create(:song)
      end

      it "レスポンスのステータスが[302（失敗)」になる" do
        delete :destroy, params: { id: @song.id }
        expect(response).to have_http_status "302"
      end

      it "サインイン画面にリダイレクトする" do
        delete :destroy, params: { id: @song.id }
        expect(response).to redirect_to new_user_session_path
      end
      
      it "投稿を削除できない" do
        expect {
          delete :destroy, params: { id: @song.id }
        }.to_not change(Song, :count)
      end
    end
  end
end
