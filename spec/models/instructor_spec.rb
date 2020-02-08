require 'rails_helper'

RSpec.describe Instructor, type: :model do
 describe 'Instructorモデルのバリデーションテスト' do
    it 'ユーザー情報が入力されていればアカウントが作成される' do
      instructor = create(:instructor)
      expect(instructor).to be_valid
    end

    it '名前が１1文字以上なら無効' do
      instructor = build(:instructor, name: "a"*11)
      instructor.valid?
      expect(instructor.errors[:name]).to include('は10文字以下で入力してください。')
    end

    it 'ユーザー名が空なら無効' do
      instructor = build(:instructor, name: '')
      instructor.valid?
      expect(instructor.errors[:name]).to include('が入力されていません。')
    end
    
    it '自己紹介文が１２１文字以上なら無効' do
      instructor = build(:instructor, description: "a"*121)
      instructor.valid?
      expect(instructor.errors[:description]).to include('は120文字以下で入力してください。')
    end
    it 'ログインIDが空なら無効' do
      instructor = build(:instructor, login_id: '')
      instructor.valid?
      expect(instructor.errors[:login_id]).to include('が入力されていません。')
    end

    it 'ログインIDが9文字以下なら無効' do
      instructor = build(:instructor, login_id: 'a'*9)
      instructor.valid?
      expect(instructor.errors[:login_id]).to include('は10文字以上で入力してください。')
    end
  end
end
