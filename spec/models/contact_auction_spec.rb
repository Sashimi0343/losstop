require 'rails_helper'

RSpec.describe ContactAuction, type: :model do
  before do
    user = FactoryBot.create(:user)
    company = FactoryBot.create(:company)
    order = FactoryBot.create(:order_auction)
    @contact = FactoryBot.build(:contact_auction, company_id: company.id, user_id: user.id, order_auction_id: order.id, )
  end

  describe '取引連絡のメッセージについて' do
    context 'OK：取引メッセージが送信できる○' do
      it 'OK：全ての項目が適切に記入出来ていればメッセージが送信できる。' do
        expect(@contact).to be_valid
        sleep 1
      end

      it 'OK：companyが空でも良い' do
        @contact.company_id = nil
        expect(@contact).to be_valid
        sleep 1
      end

      it 'OK：userが空でも良い' do
        @contact.user_id = nil
        expect(@contact).to be_valid
        sleep 1
      end
    end
    context 'NG：取引メッセージが送信できない×' do
      it 'NG：messageが空' do
        @contact.message = ""
        @contact.valid?
        expect(@contact.errors.full_messages).to include("メッセージを入力してください")
        sleep 1
      end

      it 'NG：order_auction_idが存在しない' do
        @contact.order_auction_id = nil
        @contact.valid?
        expect(@contact.errors.full_messages).to include("Order auctionを入力してください")
        sleep 1
      end
    end
  end
end
