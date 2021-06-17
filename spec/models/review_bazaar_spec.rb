require 'rails_helper'

RSpec.describe ReviewBazaar, type: :model do
  before do
    bazaar = FactoryBot.create(:bazaar)
    user = FactoryBot.create(:user)
    company = FactoryBot.create(:company)
    @review = FactoryBot.build(:review_bazaar, bazaar_id: bazaar.id, user_id: user.id, company_id: company.id)
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
        @review.comment = ""
        @review.valid?
        expect(@review.errors.full_messages).to include("コメントを入力してください")
        sleep 1
      end

      it 'NG：bazaar_idが存在しない' do
        @review.bazaar_id = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("Bazaarを入力してください")
        sleep 1
      end
    end
  end
end
