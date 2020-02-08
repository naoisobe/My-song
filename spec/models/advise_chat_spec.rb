require 'rails_helper'

RSpec.describe AdviseChat, type: :model do
    describe 'Advise_chatモデルのバリデーションテスト'do

    it 'メッセージが空の場合無効' do
      message = build(:advise_chat, message: '')
      message.valid?
      expect(message.errors[:message]).to include('が入力されていません。')
    end

    it 'メッセージが１００１文字以上の場合無効' do
      message = build(:advise_chat, message: 'a'*1001)
      message.valid?
      expect(message.errors[:message]).to include('は1000文字以下で入力してください。')
    end
  end
end
