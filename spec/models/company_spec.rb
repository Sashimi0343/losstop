require 'rails_helper'

RSpec.describe Company, type: :model do
  before do
    @company = FactoryBot.build(:company)
  end

  describe '会社登録' do
    context '会社登録ができる' do
      it 'OK：全ての項目が適切に記入出来ていれば登録ができる。' do
        expect(@company).to be_valid
      end

      it 'OK：homepageは無くても良い' do
        @company.homepage = ''
        expect(@company).to be_valid
      end
    end

    context '会社登録ができない' do
      context 'name・email・passwordについて' do
        it 'NG：nameが空' do
          @company.name = ''
          @company.valid?
          expect(@company.errors.full_messages).to include("会社・お店の名前を入力してください")
        end

        it 'NG：emailが空' do
          @company.email = ''
          @company.valid?
          expect(@company.errors.full_messages).to include("Eメールを入力してください")
        end

        it 'NG：emailが既に使用されている' do
          @company.save
          @company2 = FactoryBot.build(:company)
          @company2.email = @company.email
          @company2.valid?
          expect(@company2.errors.full_messages).to include('Eメールはすでに存在します')
        end

        it 'NG：emailに＠がない' do
          @company.email = '12345'
          @company.valid?
          expect(@company.errors.full_messages).to include('Eメールは不正な値です')
        end

        it 'NG：passwordが空' do
          @company.password = ''
          @company.valid?
          expect(@company.errors.full_messages).to include("パスワードを入力してください")
        end

        it 'NG：passwordが5文字以下' do
          @company.password = 'test1'
          @company.password_confirmation = 'test1'
          @company.valid?
          expect(@company.errors.full_messages).to include('パスワードは6文字以上で入力してください')
        end

        it 'NG：passwordが半角英語のみでは登録できない' do
          @company.password = 'testtest'
          @company.password_confirmation = 'testtest'
          @company.valid?
          expect(@company.errors.full_messages).to include('パスワードは、半角の英数字両方を使用してください。')
        end

        it 'NG：passwordが数字のみの登録はできない' do
          @company.password = '111111'
          @company.password_confirmation = '111111'
          @company.valid?
          expect(@company.errors.full_messages).to include('パスワードは、半角の英数字両方を使用してください。')
        end

        it 'NG：passwordが全角英数混合は登録できない' do
          @company.password = 'qwrt１２'
          @company.password_confirmation = 'qwrt１２'
          @company.valid?
          expect(@company.errors.full_messages).to include('パスワードは、半角の英数字両方を使用してください。')
        end

        it 'NG：password_confirmationが不一致' do
          @company.password_confirmation = 'test10000'
          @company.valid?
          expect(@company.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
        end
      end

      context 'president・profile・phoneについて' do
        it 'NG：presidentが空' do
          @company.president = ''
          @company.valid?
          expect(@company.errors.full_messages).to include('代表者名を入力してください')
        end

        it 'NG：profileが空' do
          @company.profile = ''
          @company.valid?
          expect(@company.errors.full_messages).to include('会社・お店の紹介を入力してください')
        end

        it 'NG：phoneが空' do
          @company.phone = ''
          @company.valid?
          expect(@company.errors.full_messages).to include('電話番号を入力してください')
        end

        it 'NG：phoneの桁数が多い' do
          @company.phone = '080123456789'
          @company.valid?
          expect(@company.errors.full_messages).to include('電話番号は11桁以内で入力してください。')
        end

        it 'NG：phoneが空' do
          @company.phone = '０８０５４８６４１２４'
          @company.valid?
          expect(@company.errors.full_messages).to include('電話番号は半角数字で入力してください。')
        end

        it 'NG：phoneが空' do
          @company.phone = 'test1000000'
          @company.valid?
          expect(@company.errors.full_messages).to include('電話番号は半角数字で入力してください。')
        end

      end

      context 'prefecture・city・addressについて' do
        it 'NG：prefecture_idが選択されていない' do
          @company.prefecture_id = 0
          @company.valid?
          expect(@company.errors.full_messages).to include('都道府県を選択してください。')
        end

        it 'NG：cityが空' do
          @company.city = ''
          @company.valid?
          expect(@company.errors.full_messages).to include('市区町村を入力してください')
        end

        it 'NG：addressが空' do
          @company.address = ''
          @company.valid?
          expect(@company.errors.full_messages).to include('番地〜建物〜部屋番号を入力してください')
        end
      end

    end
  end
end
