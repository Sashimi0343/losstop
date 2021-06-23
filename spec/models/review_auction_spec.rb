require 'rails_helper'

RSpec.describe ReviewAuction, type: :model do
  before do
    auction = FactoryBot.create(:auction)
    user = FactoryBot.create(:user)
    company = FactoryBot.create(:company)
    @review = FactoryBot.build(:review_auction, auction_id: auction.id, user_id: user.id, company_id: company.id)
  end

  describe 'レビューについて' do
    context 'OK：レビューができる○' do
      it 'OK：全ての項目が適切に記入出来ていればメッセージが送信できる。' do
        expect(@review).to be_valid
        sleep 1
      end

      it 'OK：companyが空でも良い' do
        @review.company_id = nil
        expect(@review).to be_valid
        sleep 1
      end

      it 'OK：userが空でも良い' do
        @review.user_id = nil
        expect(@review).to be_valid
        sleep 1
      end
    end
    context 'NG：レビューができない×' do
      it 'NG：commentが空' do
        @review.comment = ''
        @review.valid?
        expect(@review.errors.full_messages).to include('コメントを入力してください')
        sleep 1
      end

      it 'NG：auction_idが存在しない' do
        @review.auction_id = nil
        @review.valid?
        expect(@review.errors.full_messages).to include('Auctionを入力してください')
        sleep 1
      end
    end
  end
end
