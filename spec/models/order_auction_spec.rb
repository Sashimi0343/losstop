require 'rails_helper'

RSpec.describe OrderAuction, type: :model do
  before do
    auction = FactoryBot.create(:auction)
    company = FactoryBot.create(:company)
    user = FactoryBot.create(:user)
    @order = FactoryBot.build(:order_auction, auction_id: auction.id, company_id: company.id, user_id: user.id)
  end

  describe '商品の取引連絡部屋について' do
    context 'OK：取引連絡部屋の作成○' do
      it 'OK：全ての項目が適切に記入出来ていれば取引連絡部屋が作成できる。' do
        expect(@order).to be_valid
        sleep 1
      end
    end
    context 'NG：取引部屋作成×' do
      context 'NG：title・description・price・active・auction_id・company_idについて' do
        it 'NG：titleが空' do
          @order.title = ''
          @order.valid?
          expect(@order.errors.full_messages).to include('商品名を入力してください')
          sleep 1
        end

        it 'NG：descriptionが空' do
          @order.description = ''
          @order.valid?
          expect(@order.errors.full_messages).to include('商品説明欄を入力してください')
          sleep 1
        end

        it 'NG：priceが空' do
          @order.price = ''
          @order.valid?
          expect(@order.errors.full_messages).to include('価格は半角数字で入力してください。')
          sleep 1
        end

        it 'NG：priceが全角数字' do
          @order.price = '１'
          @order.valid?
          expect(@order.errors.full_messages).to include('価格は半角数字で入力してください。')
          sleep 1
        end

        it 'NG：priceが全角文字列' do
          @order.price = 'あ'
          @order.valid?
          expect(@order.errors.full_messages).to include('価格は半角数字で入力してください。')
          sleep 1
        end

        it 'NG：priceが半角英字' do
          @order.price = 'a'
          @order.valid?
          expect(@order.errors.full_messages).to include('価格は半角数字で入力してください。')
          sleep 1
        end

        it 'NG：activeが空' do
          @order.active = nil
          @order.valid?
          expect(@order.errors.full_messages).to include('Activeを入力してください')
          sleep 1
        end

        it 'NG：auction_idが空' do
          @order.auction_id = nil
          @order.valid?
          expect(@order.errors.full_messages).to include('Auctionを入力してください')
          sleep 1
        end

        it 'NG：company_idが空' do
          @order.company_id = nil
          @order.valid?
          expect(@order.errors.full_messages).to include('Companyを入力してください')
          sleep 1
        end

        it 'NG：company_idが空' do
          @order.user_id = nil
          @order.valid?
          expect(@order.errors.full_messages).to include('Userを入力してください')
          sleep 1
        end

      end
    end
  end
end
