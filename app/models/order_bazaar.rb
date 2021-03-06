class OrderBazaar < ApplicationRecord
  with_options presence: true do
    validates :active
    validates :quantity, numericality: { only_integer: true, message: 'は半角数字で入力してください。' }
  end

  has_many :contact_bazaars, dependent: :destroy
  belongs_to :bazaar
  belongs_to :user
  belongs_to :company

  has_many :notice_companys, dependent: :destroy
end
