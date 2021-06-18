require 'rails_helper'

RSpec.describe OrderAuction, type: :model do
  before do
    auction = FactoryBot.create(:auction)
    company = FactoryBot.create(:company)
    @order = FactoryBot.build(:order_auction, auction_id: auction.id, company_id: company.id)
  end

  describe '商品の取引連絡部屋について' do
    context 'OK：取引連絡部屋の作成○' do
      it 'OK：全ての項目が適切に記入出来ていれば取引連絡部屋が作成できる。' do
        expect(@order).to be_valid
      end
    end
    context 'NG：取引部屋作成×' do
      context 'NG：title・description・quantity・auction_id・company_idについて' do

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

        it 'NG：quantityが空' do
          @order.quantity = ''
          @order.valid?
          expect(@order.errors.full_messages).to include('販売希望数は半角数字で入力してください。')
          sleep 1
        end

        it 'NG：quantityが全角数字' do
          @order.quantity = '１'
          @order.valid?
          expect(@order.errors.full_messages).to include('販売希望数は半角数字で入力してください。')
          sleep 1
        end

        it 'NG：quantityが全角文字列' do
          @order.quantity = 'あ'
          @order.valid?
          expect(@order.errors.full_messages).to include('販売希望数は半角数字で入力してください。')
          sleep 1
        end

        it 'NG：quantityが半角英字' do
          @order.quantity = 'a'
          @order.valid?
          expect(@order.errors.full_messages).to include('販売希望数は半角数字で入力してください。')
          sleep 1
        end

        it 'NG：auction_idが空' do
          @order.auction_id = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("Auctionを入力してください")
          sleep 1
        end

        it 'NG：company_idが空' do
          @order.company_id = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("Companyを入力してください")
          sleep 1
        end
      end
    end
  end
end
