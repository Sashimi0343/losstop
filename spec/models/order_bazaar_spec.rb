require 'rails_helper'

RSpec.describe OrderBazaar, type: :model do
  before do
    bazaar = FactoryBot.create(:bazaar)
    user = FactoryBot.create(:user)
    @order = FactoryBot.build(:order_bazaar, bazaar_id: bazaar.id, user_id: user.id)
  end

  describe '商品の取引連絡部屋について' do
    context 'OK：取引連絡部屋の作成○' do
      it 'OK：全ての項目が適切に記入出来ていれば取引連絡部屋が作成できる。' do
        expect(@order).to be_valid
      end
    end
    context 'NG：取引部屋作成×' do
      context 'NG：quantity・bazaar_id・user_idについて' do
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

        it 'NG：bazaar_idが空' do
          @order.bazaar_id = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("Bazaarを入力してください", "Bazaarを入力してください")
          sleep 1
        end

        it 'NG：user_idが空' do
          @order.user_id = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("Userを入力してください", "Userを入力してください")
          sleep 1
        end
      end
    end
  end
end
