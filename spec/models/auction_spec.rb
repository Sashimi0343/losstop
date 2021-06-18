require 'rails_helper'

RSpec.describe Auction, type: :model do
  before do
    @auction = FactoryBot.build(:auction)
  end

  describe '買いたい！の出品について' do
    context 'OK：買いたい！の出品○' do
      it 'OK：全ての項目が適切に記入出来ていれば出品ができる。' do
        expect(@auction).to be_valid
      end
    end

    context 'NG：買いたいの出品×' do
      context 'NG：title・description・image・priceについて' do
        it 'NG：titleが空' do
          @auction.title = ''
          @auction.valid?
          expect(@auction.errors.full_messages).to include('タイトルを入力してください')
        end

        it 'NG：descriptionが空' do
          @auction.description = ''
          @auction.valid?
          expect(@auction.errors.full_messages).to include('欲しい商品の詳細を入力してください')
        end

        it 'NG：priceが空' do
          @auction.price = ''
          @auction.valid?
          expect(@auction.errors.full_messages).to include('希望価格(単価)を入力してください')
        end

        it 'NG：priceが300円未満' do
          @auction.price = 100
          @auction.valid?
          expect(@auction.errors.full_messages).to include('希望価格(単価)は300円から設定可能です。')
        end

        it 'NG：priceが全角数字' do
          @auction.price = '５００'
          @auction.valid?
          expect(@auction.errors.full_messages).to include('希望価格(単価)は半角数字で入力してください。')
        end

        it 'NG：priceが半角英数混合' do
          @auction.price = 'test300'
          @auction.valid?
          expect(@auction.errors.full_messages).to include('希望価格(単価)は半角数字で入力してください。')
        end

        it 'NG：priceが全角英数混合' do
          @auction.price = 'tcj３００'
          @auction.valid?
          expect(@auction.errors.full_messages).to include('希望価格(単価)は半角数字で入力してください。')
        end
      end

      context 'NG：stock・ActiveHashの3つ・companyについて' do
        it 'NG：stockが空' do
          @auction.stock = ''
          @auction.valid?
          expect(@auction.errors.full_messages).to include('購入希望上限数を入力してください')
        end

        it 'NG：stockが1未満' do
          @auction.stock = 0
          @auction.valid?
          expect(@auction.errors.full_messages).to include('購入希望上限数は1〜99,999個まで設定可能です。')
        end

        it 'NG：stockが全角数字' do
          @auction.stock = '５００'
          @auction.valid?
          expect(@auction.errors.full_messages).to include('購入希望上限数は半角数字で入力してください。')
        end

        it 'NG：stockが半角英数混合' do
          @auction.stock = 'test300'
          @auction.valid?
          expect(@auction.errors.full_messages).to include('購入希望上限数は半角数字で入力してください。')
        end

        it 'NG：stockが全角英数混合' do
          @auction.stock = 'tcj３００'
          @auction.valid?
          expect(@auction.errors.full_messages).to include('購入希望上限数は半角数字で入力してください。')
        end

        it 'NG：category_idが選択されていない' do
          @auction.category_id = 0
          @auction.valid?
          expect(@auction.errors.full_messages).to include('カテゴリーを選択してください。')
        end

        it 'NG：delivery_charge_idが選択されていない' do
          @auction.delivery_charge_id = 0
          @auction.valid?
          expect(@auction.errors.full_messages).to include('送料の負担を選択してください。')
        end

        it 'NG：days_to_ship_idが選択されていない' do
          @auction.days_to_ship_id = 0
          @auction.valid?
          expect(@auction.errors.full_messages).to include('発送までの日にちを選択してください。')
        end

        it 'NG：userが存在しない' do
          @auction.user = nil
          @auction.valid?
          expect(@auction.errors.full_messages).to include('Userを入力してください')
        end
      end
    end
  end
end
