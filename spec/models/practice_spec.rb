require 'rails_helper'

RSpec.describe Practice, type: :model do
  describe 'Practiceモデルのバリデーションテスト'do

    it 'すべてのカラムに情報が入力されている状態で保存' do
      practice = create(:practice)
      expect(practice).to be_valid
    end

    context 'titleカラムのテスト' do 
      it 'titleが空の場合無効' do
        practice = build(:practice, title: '' )
        practice.valid?
        expect(practice.errors[:title]).to include('が入力されていません。')
      end

      it 'titleが３１文字以上の場合無効' do
        practice = build(:practice, title: 'a'*31)
        practice.valid?
        expect(practice.errors[:title]).to include('は30文字以下で入力してください。')
      end
    end

      context 'descriptionカラムのテスト' do

        it 'descriprionが５０１文字以上の場合無効' do
          practice = build(:practice, description: 'a'*501)
          expect(practice.errors[:description]).to include('は500文字以下で入力してください。')
      end

        it 'descriprionが空場合無効' do
          practice = build(:practice, description: '')
          expect(practice.errors[:description]).to include('が入力されていません。')
      end
    end

    context 'videoカラムのテスト' do
      it 'voiceが選択されていない場合無効' do
        practice = build(:practice, video: nil) 
        expect(practice.errors[:video]).to include('が選択されていません。')
      end
    end
  end
end
