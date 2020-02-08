require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Userモデルのバリデーションテスト' do
    it 'ユーザー情報が入力されていればアカウントが作成される' do
      user = create(:user)
      expect(user).to be_valid
    end

    it 'ユーザー名が１６文字以上なら無効' do
      user = build(:user, name: "a"*16)
      user.valid?
      expect(user.errors[:name]).to include('は15文字以下で入力してください。')
    end

    it 'ユーザー名が空なら無効' do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include('が入力されていません。')
    end
    
    it '自己紹介文が１０１文字以上なら無効' do
      user = build(:user, description: "a"*101 )
      user.valid?
      expect(user.errors[:description]).to include('は100文字以下で入力してください。')
    end
  end
end
