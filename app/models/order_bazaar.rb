class OrderBazaar < ApplicationRecord
  with_options presence: true do
    validates :bazaar_id, :user_id
    validates :quantity, numericality: { only_integer: true, message: 'は半角数字で入力してください。' }
  end

  has_many :contact_bazaars, dependent: :destroy
  belongs_to :bazaar
  belongs_to :user

  has_many :notice_companies, dependent: :destroy
end
