require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Userモデルのバリデーションテスト' do

    it '既存の名前は無効' do
      user.create(:user, name: 'testtaro')
      other_user = build(:user, name: 'testtaro')
      other_user.valid?
      expect(other_user.errors[:name]).to include('すでに存在しています7')
    end

    it 'ユーザー名が６文字以上なら有効' do
      user = create(:user, name: 'a'*6)
      expect(user).to be_valid
    end

    it 'ユーザー名が５文字以下なら無効' do
      user = create(:user, name: 'a'*5)
      user.valid?
      expect(user.errors[:name]).to include('ユーザー名を以上で入力してください')
    end
    
    it '自己紹介文が１００文字以内なら有効' do 
      user = create(:user, description: 'a'*100)
      expect(user).to be_valid
    end

    it '自己紹介文が１０１文字以上なら無効' do
      user = create(:user, description: 'a'*101)
      user.valid?
      expect(user.errors[:description]).to include('１００文字以内で入力してください')
    end
  end
end
