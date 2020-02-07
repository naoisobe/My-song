require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "ログイン状態でrootパスにアクセスすると投稿一覧にリダレクトする" do
      user = FactoryBot.create(:correct_user)
      sign_in user
      get :index
      expect(response).to redirect_to ('songs/index')
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

end
