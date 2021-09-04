require 'rails_helper'

RSpec.describe Auction, type: :model do
  before do
    @auction = FactoryBot.build(:auction)
  end

  describe '買いたい！の出品について' do
    context 'OK：買いたい！の投稿○' do
      it 'OK：全ての項目が適切に記入出来ていれば出品ができる。' do
        expect(@auction).to be_valid
        sleep 0.1
      end
    end

    context 'NG：買いたいの出品×' do
      context 'NG：title・description・priceについて' do
        it 'NG：titleが空' do
          @auction.title = ''
          @auction.valid?
          expect(@auction.errors.full_messages).to include('タイトルを入力してください')
          sleep 0.1
        end

        it 'NG：descriptionが空' do
          @auction.description = ''
          @auction.valid?
          expect(@auction.errors.full_messages).to include('欲しい商品の詳細を入力してください')
          sleep 0.1
        end

        it 'NG：priceが空' do
          @auction.price = ''
          @auction.valid?
          expect(@auction.errors.full_messages).to include('予算を入力してください')
          sleep 0.1
        end

        it 'NG：priceが300円未満' do
          @auction.price = 100
          @auction.valid?
          expect(@auction.errors.full_messages).to include('予算は300円から設定可能です。')
          sleep 0.1
        end

        it 'NG：priceが全角数字' do
          @auction.price = '５００'
          @auction.valid?
          expect(@auction.errors.full_messages).to include('予算は半角数字で入力してください。')
          sleep 0.1
        end

        it 'NG：priceが半角英数混合' do
          @auction.price = 'test300'
          @auction.valid?
          expect(@auction.errors.full_messages).to include('予算は半角数字で入力してください。')
          sleep 0.1
        end

        it 'NG：priceが全角英数混合' do
          @auction.price = 'tcj３００'
          @auction.valid?
          expect(@auction.errors.full_messages).to include('予算は半角数字で入力してください。')
          sleep 0.1
        end
      end

      context 'NG：deadline・active・ActiveHashの2つ・userについて' do
        it 'NG：deadlineが空' do
          @auction.deadline = nil
          @auction.valid?
          expect(@auction.errors.full_messages).to include('公開期間を入力してください')
          sleep 0.1
        end

        it 'NG：activeが空' do
          @auction.active = ''
          @auction.valid?
          expect(@auction.errors.full_messages).to include('Activeを入力してください')
          sleep 0.1
        end

        it 'NG：category_idが選択されていない' do
          @auction.category_id = nil
          @auction.valid?
          expect(@auction.errors.full_messages).to include('カテゴリーを選択してください。')
          sleep 0.1
        end

        it 'NG：delivery_charge_idが選択されていない' do
          @auction.delivery_charge_id = nil
          @auction.valid?
          expect(@auction.errors.full_messages).to include('送料を選択してください。')
          sleep 0.1
        end

        it 'NG：userが存在しない' do
          @auction.user = nil
          @auction.valid?
          expect(@auction.errors.full_messages).to include('Userを入力してください')
          sleep 0.1
        end
      end
    end
  end
end
