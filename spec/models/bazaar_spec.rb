require 'rails_helper'

RSpec.describe Bazaar, type: :model do
  before do
    @bazaar = FactoryBot.build(:bazaar)
  end

  describe '商品の出品について' do
    context 'OK：商品の出品○' do
      it 'OK：全ての項目が適切に記入出来ていれば出品ができる。' do
        expect(@bazaar).to be_valid
      end
    end

    context 'NG：商品の出品×' do
      context 'NG：title・description・image・priceについて' do
        it 'NG：titleが空' do
          @bazaar.title = ''
          @bazaar.valid?
          expect(@bazaar.errors.full_messages).to include("商品名を入力してください")
        end

        it 'NG：descriptionが空' do
          @bazaar.description = ''
          @bazaar.valid?
          expect(@bazaar.errors.full_messages).to include("商品の紹介を入力してください")
        end

        it 'NG：imageが空' do
          @bazaar.image = nil
          @bazaar.valid?
          expect(@bazaar.errors.full_messages).to include("画像を入力してください")
        end

        it 'NG：priceが空' do
          @bazaar.price = ''
          @bazaar.valid?
          expect(@bazaar.errors.full_messages).to include("価格を入力してください")
        end

        it 'NG：priceが300円未満' do
          @bazaar.price = 100
          @bazaar.valid?
          expect(@bazaar.errors.full_messages).to include("価格は300円から設定可能です。")
        end

        it 'NG：priceが全角数字' do
          @bazaar.price = '５００'
          @bazaar.valid?
          expect(@bazaar.errors.full_messages).to include("価格は半角数字で入力してください。")
        end

        it 'NG：priceが半角英数混合' do
          @bazaar.price = 'test300'
          @bazaar.valid?
          expect(@bazaar.errors.full_messages).to include("価格は半角数字で入力してください。")
        end

        it 'NG：priceが全角英数混合' do
          @bazaar.price = 'tcj３００'
          @bazaar.valid?
          expect(@bazaar.errors.full_messages).to include("価格は半角数字で入力してください。")
        end
      end


      context 'NG：stock・ActiveHashの3つ・companyについて' do
        it 'NG：stockが空' do
          @bazaar.stock = ''
          @bazaar.valid?
          expect(@bazaar.errors.full_messages).to include("在庫を入力してください")
        end

        it 'NG：stockが1未満' do
          @bazaar.stock = 0
          @bazaar.valid?
          expect(@bazaar.errors.full_messages).to include("在庫は1〜99,999個まで設定可能です。")
        end

        it 'NG：stockが全角数字' do
          @bazaar.stock = '５００'
          @bazaar.valid?
          expect(@bazaar.errors.full_messages).to include("在庫は半角数字で入力してください。")
        end

        it 'NG：stockが半角英数混合' do
          @bazaar.stock = 'test300'
          @bazaar.valid?
          expect(@bazaar.errors.full_messages).to include("在庫は半角数字で入力してください。")
        end

        it 'NG：stockが全角英数混合' do
          @bazaar.stock = 'tcj３００'
          @bazaar.valid?
          expect(@bazaar.errors.full_messages).to include("在庫は半角数字で入力してください。")
        end

        it 'NG：category_idが選択されていない' do
          @bazaar.category_id = 0
          @bazaar.valid?
          expect(@bazaar.errors.full_messages).to include('カテゴリーを選択してください。')
        end

        it 'NG：delivery_charge_idが選択されていない' do
          @bazaar.delivery_charge_id = 0
          @bazaar.valid?
          expect(@bazaar.errors.full_messages).to include('送料の負担を選択してください。')
        end

        it 'NG：days_to_ship_idが選択されていない' do
          @bazaar.days_to_ship_id = 0
          @bazaar.valid?
          expect(@bazaar.errors.full_messages).to include('発送までの日にちを選択してください。')
        end

        it 'NG：companyが存在しない' do
          @bazaar.company = nil
          @bazaar.valid?
          expect(@bazaar.errors.full_messages).to include('Companyを入力してください')
        end
      end
    end
  end
end