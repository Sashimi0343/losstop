require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do
    context 'ユーザー登録ができる' do
      it 'OK：全ての項目が適切に記入出来ていれば登録ができる。' do
        expect(@user).to be_valid
        sleep 0.1
      end

      it 'OK：profileは空でも良い' do
        profile = ""
        expect(@user).to be_valid
        sleep 0.1
      end
    end

    context 'ユーザー登録ができない' do
      context 'name・email・passwordについて' do
        it 'NG：nameが空' do
          @user.name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('ニックネームを入力してください')
          sleep 0.1
        end

        it 'NG：emailが空' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('Eメールを入力してください')
          sleep 0.1
        end

        it 'NG：emailが既に使用されている' do
          @user.save
          @user2 = FactoryBot.build(:user)
          @user2.email = @user.email
          @user2.valid?
          expect(@user2.errors.full_messages).to include('Eメールはすでに存在します')
          sleep 0.1
        end

        it 'NG：emailに＠がない' do
          @user.email = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Eメールは不正な値です')
          sleep 0.1
        end

        it 'NG：passwordが空' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードを入力してください')
          sleep 0.1
        end

        it 'NG：passwordが5文字以下' do
          @user.password = 'test1'
          @user.password_confirmation = 'test1'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
          sleep 0.1
        end

        it 'NG：passwordが半角英語のみでは登録できない' do
          @user.password = 'testtest'
          @user.password_confirmation = 'testtest'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは、半角の英数字両方を使用してください。')
          sleep 0.1
        end

        it 'NG：passwordが数字のみの登録はできない' do
          @user.password = '111111'
          @user.password_confirmation = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは、半角の英数字両方を使用してください。')
          sleep 0.1
        end

        it 'NG：passwordが全角英数混合は登録できない' do
          @user.password = 'qwrt１２'
          @user.password_confirmation = 'qwrt１２'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは、半角の英数字両方を使用してください。')
          sleep 0.1
        end

        it 'NG：password_confirmationが不一致' do
          @user.password_confirmation = 'test10000'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
          sleep 0.1
        end
      end

      context 'name4種・birthdayについて' do
        it 'NG：last_nameが空' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('苗字を入力してください')
          sleep 0.1
        end

        it 'NG：last_nameがひらがな・カタカナ・漢字ではない' do
          @user.last_name = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include('苗字は、全角「漢字・ひらがな・カタカナ」で入力してください。')
          sleep 0.1
        end

        it 'NG：first_nameが空' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('名前を入力してください')
          sleep 0.1
        end

        it 'NG：first_nameがひらがな・カタカナ・漢字ではない' do
          @user.first_name = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include('名前は、全角「漢字・ひらがな・カタカナ」で入力してください。')
          sleep 0.1
        end

        it 'NG：last_name_kanaが空' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('苗字（カタカナ）を入力してください')
          sleep 0.1
        end

        it 'NG：last_name_kanaがカタカナではない' do
          @user.last_name_kana = 'TEST'
          @user.valid?
          expect(@user.errors.full_messages).to include('苗字（カタカナ）は、全角カタカナで入力してください。')
          sleep 0.1
        end

        it 'NG：first_name_kanaが空' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('名前（カタカナ）を入力してください')
          sleep 0.1
        end

        it 'NG：first_name_kanaがカタカナではない' do
          @user.first_name_kana = 'TEST'
          @user.valid?
          expect(@user.errors.full_messages).to include('名前（カタカナ）は、全角カタカナで入力してください。')
          sleep 0.1
        end

        it 'NG：birthdayが空' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('誕生日を入力してください')
          sleep 0.1
        end
      end
    end
  end
end
