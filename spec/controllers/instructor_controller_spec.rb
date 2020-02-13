require 'rails_helper'

RSpec.describe InstructorController, type: :controller do
  describe "updateアクション" do
    context "userがinstructorを編集しようとした場合(ログイン時)" do

    before do
      @instructor = FactoryBot.create(:instructor)
      @user = FactoryBot.create(:user)
    end

    it "他人のinstructor情報を更新することができない" do
      instructor_params = FactoryBot.attributes_for(:instructor, name: "ChangeName")
      sign_in @user
      patch :update, params: { id: @instructor.id, instructor: instructor_params }
      expect(@instructor.reload.name).to eq "testtaro"
    end

    it "投稿一覧ページにリダイレクトする" do
      instructor_params = FactoryBot.attributes_for(:instructor)
      sign_in @user
      patch :update, params: { id: @instructor.id, instructor: instructor_params }
      expect(response).to redirect_to songs_path
    end
  end

    context "未ログイン時" do

      before do
        @instructor = FactoryBot.create(:instructor)
      end

      it "レスポンスのステータスが[302（失敗)」になる" do
        instructor_params = FactoryBot.attributes_for(:instructor)
        patch :update, params: { id: @instructor.id, instructor: instructor_params }
        expect(response).to have_http_status "302"
      end

      it "サインイン画面にリダイレクトする" do
        instructor_params = FactoryBot.attributes_for(:instructor)
        patch :update, params: { id: @instructor.id, instructor: instructor_params }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
