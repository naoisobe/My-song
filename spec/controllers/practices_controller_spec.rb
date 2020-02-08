require 'rails_helper'

RSpec.describe PracticesController, type: :controller do
  describe "indexアクション" do
    context "ログイン時" do
      before do
        @user = FactoryBot.create(:user)
      end
    end
      it "レスポンスのステータスが[302（失敗)」になる" do
        sign_in @user
        get :index
        expect(response).to have_http_status "302"
      end

      it "投稿一覧ページに遷移する" do
        sign_in @user
        get :index
        expect(response).to redirect_to songs_path
      end

    context "未ログイン時" do
      it "レスポンスのステータスが[302（失敗)」になる" do
        get :index
        expect(response).to have_http_status "302"
      end

      it "サインインページに遷移する" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
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
        practice_params = FactoryBot.attributes_for(:practice)
        post :create, params: { practice: practice_params }
        expect(response).to have_http_status "302"
      end

      it "サインインページに遷移する" do
        practice_params = FactoryBot.attributes_for(:practice)
        post :create, params: { practice: practice_params }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "updateアクション" do
    context "他人のpracticeの投稿を更新しようとした場合(ログイン時)" do
    
      before do
        @user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:other_user)
        @practice = FactoryBot.create(:practice, user: other_user, title: "Same Title")
      end

      it "投稿を更新できない" do
        practice_params = FactoryBot.attributes_for(:practice, title: "testname")
        sign_in @user
        patch :update, params: { id: @practice.id, practice: practice_params }
        expect(@practice.reload.title).to eq "Same Title"
      end

      it "投稿一覧ページにリダイレクトする" do
        practice_params = FactoryBot.attributes_for(:practice)
        sign_in @user
        patch :update, params: { id: @practice.id, practice: practice_params }
        expect(response).to redirect_to songs_path
      end
    end

    context "未ログイン時" do

      before do
        @practice = FactoryBot.create(:practice)
      end

      it "レスポンスのステータスが[302（失敗)」になる" do
        practice_params = FactoryBot.attributes_for(:practice)
        patch :update, params: { id: @practice.id, practice: practice_params }
        expect(response).to have_http_status "302"
      end

      it "サインイン画面にリダイレクトする" do
        practice_params = FactoryBot.attributes_for(:practice)
        patch :update, params: { id: @practice.id, practice: practice_params }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "destroyアクション" do
    context "他人のpracticeの投稿を削除しようとした場合(ログイン時)" do
    
      before do
        @user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:other_user)
        @practice = FactoryBot.create(:practice, user: other_user )
      end

      it "投稿を削除できない" do
        sign_in @user
        expect {
          delete :destroy, params: { id: @practice.id }    
        }.to_not change(Practice, :count)
      end

      it "投稿一覧ページにリダイレクトする" do
        sign_in @user
        delete :destroy, params: { id: @practice.id}
        expect(response).to redirect_to songs_path
      end
    end

    context "未ログイン時" do

      before do
        @practice = FactoryBot.create(:practice)
      end

      it "レスポンスのステータスが[302（失敗)」になる" do
        delete :destroy, params: { id: @practice.id }
        expect(response).to have_http_status "302"
      end

      it "サインイン画面にリダイレクトする" do
        delete :destroy, params: { id: @practice.id }
        expect(response).to redirect_to new_user_session_path
      end
      
      it "投稿を削除できない" do
        expect {
          delete :destroy, params: { id: @practice.id }
        }.to_not change(Practice, :count)
      end
    end
  end
end
