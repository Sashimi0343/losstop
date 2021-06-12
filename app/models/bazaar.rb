class Bazaar < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions


  with_options presence: true do
    validates :title, :description, :deadline, :image

    validates :price, numericality: { only_integer: true, message: 'は半角数字で入力してください。' }
    validates_inclusion_of :price, in: 300..999_999_999, message: 'は300円から設定可能です。'

    validates :stock, numericality: { only_integer: true, message: 'は半角数字で入力してください。' }
    validates_inclusion_of :stock, in: 1..99_999, message: 'は1〜99,999個まで設定可能です。'
  end

  with_options numericality: { other_than: 0, message: 'を選択してください。' } do
    validates :category_id, :delivery_charge_id, :days_to_ship_id
  end


  belongs_to :category
  belongs_to :days_to_ship
  belongs_to :delivery_charge

  has_many_attached :images
  has_many :bazaar_orders
#  has_many :reviews
  belongs_to :company
end
