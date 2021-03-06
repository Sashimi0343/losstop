class Auction < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :title, :description, :deadline, :active

    validates :price, numericality: { only_integer: true, message: 'は半角数字で入力してください。' }
    validates_inclusion_of :price, in: 300..999_999_999, message: 'は300円から設定可能です。'
  end

  with_options numericality: { message: 'を選択してください。' } do
    validates :category_id, :delivery_charge_id
  end

  belongs_to :category
  belongs_to :delivery_charge

  has_many :order_auctions, dependent: :destroy
  has_many :review_auctions, dependent: :destroy
  belongs_to :user
end
