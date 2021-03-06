require 'rails_helper'

RSpec.describe OrderBazaar, type: :model do
  before do
    user = FactoryBot.create(:user)
    company = FactoryBot.create(:company)
    bazaar = FactoryBot.create(:bazaar)
    @order = FactoryBot.build(:order_bazaar, bazaar_id: bazaar.id,company_id: company.id , user_id: user.id)
  end

  describe '商品の取引連絡部屋について' do
    context 'OK：取引連絡部屋の作成○' do
      it 'OK：全ての項目が適切に記入出来ていれば取引連絡部屋が作成できる。' do
        expect(@order).to be_valid
        sleep 1
      end
    end
    context 'NG：取引部屋作成×' do
      context 'NG：quantity・active・bazaar_id・user_idについて' do
        it 'NG：quantityが空' do
          @order.quantity = ''
          @order.valid?
          expect(@order.errors.full_messages).to include('購入希望数は半角数字で入力してください。')
          sleep 1
        end

        it 'NG：quantityが全角数字' do
          @order.quantity = '１'
          @order.valid?
          expect(@order.errors.full_messages).to include('購入希望数は半角数字で入力してください。')
          sleep 1
        end

        it 'NG：quantityが半角英字' do
          @order.quantity = 'a'
          @order.valid?
          expect(@order.errors.full_messages).to include('購入希望数は半角数字で入力してください。')
          sleep 1
        end

        it 'NG：quantityが全角英字' do
          @order.quantity = 'A'
          @order.valid?
          expect(@order.errors.full_messages).to include('購入希望数は半角数字で入力してください。')
          sleep 1
        end

        it 'NG：quantityが全角日本語' do
          @order.quantity = 'テスト'
          @order.valid?
          expect(@order.errors.full_messages).to include('購入希望数は半角数字で入力してください。')
          sleep 1
        end

        it 'NG：activeが空' do
          @order.active = nil
          @order.valid?
          expect(@order.errors.full_messages).to include('Activeを入力してください')
          sleep 1
        end

        it 'NG：bazaar_idが空' do
          @order.bazaar_id = nil
          @order.valid?
          expect(@order.errors.full_messages).to include('Bazaarを入力してください')
          sleep 1
        end

        it 'NG：user_idが空' do
          @order.user_id = nil
          @order.valid?
          expect(@order.errors.full_messages).to include('Userを入力してください')
          sleep 1
        end

        it 'NG：company_idが空' do
          @order.company_id = nil
          @order.valid?
          expect(@order.errors.full_messages).to include('Companyを入力してください')
          sleep 1
        end
      end
    end
  end
end
