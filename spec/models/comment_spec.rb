require 'rails_helper'

RSpec.describe Comment, type: :model do
    describe 'Commentモデルのバリデーションテスト'do

    it 'メッセージが空の場合無効' do
      comment = build(:comment, content: '')
      comment.valid?
      expect(comment.errors[:content]).to include('が入力されていません。')
    end

    it 'メッセージが２０１文字以上の場合無効' do
      comment = build(:comment, content: 'a'*201)
      comment.valid?
      expect(comment.errors[:content]).to include('は200文字以下で入力してください。')
    end
  end
end
