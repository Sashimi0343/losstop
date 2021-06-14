class OrderBazaar < ApplicationRecord

  with_options presence: true do
    validates :quantity, :bazaar_id, :user_id
    validates :quantity, numericality: { only_integer: true, message: 'は半角数字で入力してください。' }
  end

  has_one :contact_bazaar
  belongs_to :bazaar
  belongs_to :user
end
