require 'rails_helper'

RSpec.describe Song, type: :model do
  
  describe 'Songモデルのバリデーションテスト'do

    it 'すべてのカラムに情報が入力されている状態で保存' do
      song = build(:song)
      expect(song).to be_valid
    end

    context 'titleカラムのテスト' do 
      it 'titleが空の場合無効' do
        song = build(:song, title: '' )
        song.valid?
        expect(song.errors[:title]).to include('が入力されていません。')
      end

      it 'titleが３０文字以上の場合無効' do
        song = build(:song, title: 'a'*31)
        song.valid?
        expect(song.errors[:title]).to include('は30文字以下で入力してください。')
      end
    end

      context 'descriptionカラムのテスト' do

        it 'descriprionが３０１文字以上の場合無効' do
          song = build(:song, description: 'a'*301)
          expect(song.errors[:description]).to include('は300文字以下で入力してください。')
      end
    end

    context 'voiceカラムのテスト' do
      it 'voiceが選択されていない場合無効' do
        song = build(:song, voice: nil) 
        expect(song.errors[:voice]).to include('が選択されていません。')
      end
    end
  end
end
