require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Userモデルのバリデーションテスト' do
    it 'ユーザー名が１５文字以下なら有効' do
      user = FactoryBot.build(:correct_user)
      expect(user).to be_valid
    end

    it 'ユーザー名が１６文字以上なら無効' do
      user = FactoryBot.build(:error_user)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include('設定して下さい。')
    end
    
    it '自己紹介文が１００文字以内なら有効' do
      user = FactoryBot.build(:correct_user)
      expect(user).to be_valid
    end

    it '自己紹介文が１０１文字以上なら無効' do
      user = FactoryBot.build(:error_user)
      user.valid?
      expect(user.errors[:description]).to include('以下に設定して下さい')
    end
  end
end
