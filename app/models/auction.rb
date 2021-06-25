class Auction < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :title, :description, :deadline

    validates :price, numericality: { only_integer: true, message: 'は半角数字で入力してください。' }
    validates_inclusion_of :price, in: 300..999_999_999, message: 'は300円から設定可能です。'

    validates :stock, numericality: { only_integer: true, message: 'は半角数字で入力してください。' }
    validates_inclusion_of :stock, in: 1..99_999, message: 'は1〜99,999個まで設定可能です。'
  end

  with_options numericality: { message: 'を選択してください。' } do
    validates :category_id, :delivery_charge_id
  end

  belongs_to :category
  belongs_to :days_to_ship
  belongs_to :delivery_charge

  has_many :order_auctions, dependent: :destroy
  has_many :review_auctions, dependent: :destroy
  belongs_to :user
end
