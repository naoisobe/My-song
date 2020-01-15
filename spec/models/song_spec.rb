require 'rails_helper'

RSpec.describe Song, type: :model do
  
  describq 'Songモデルのバリデーションテスト'do

    context 'titleカラムのテスト' do 
      it 'titleが２０文字以内の場合有効' do
        song = create(:song, title: 'a'*20)
        expect(song).to be_valid
      end
      it 'titleが空の場合無効' do
        song = create(:song, title: '' )
        song.valid?
        expect(song.errors[:title]).to include('タイトルを入力してください')
      end

      it 'titleが２１文字以上の場合無効' do
        song = create(:song, title: 'a'*21)
        song.valid?
        expect(song.errors[:title]).to include('タイトルを２０文字以内で入力してください')
      end
    end

    context 'descriptionカラムのテスト' do
      it 'desciprionが３００文字以内の場合有効' do
        description = create(:song, description: '')
        expect(song).to be_valid
      end

      it 'descriprionが３０１文字以上の場合無効' do
        description = create (:song, description: 'a'*301)
        expect(song.errors[:description]).to include('説明文を３００文字以内で入力してください')
    end
  end

    context 'voiceカラムのテスト' do
      it 'voiceが選択されていない場合無効' do
        voice = create(:song, voice: '') 
        expect(song.errors[:voice]).to include('音声ファイルを選択してください')
      end
    end
end
