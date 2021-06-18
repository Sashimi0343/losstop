class OrderAuction < ApplicationRecord

  with_options presence: true do
    validates :title, :description, :image, :auction_id, :company_id
    validates :quantity, numericality: { only_integer: true, message: 'は半角数字で入力してください。' }
  end

  has_one_attached :image
  #has_many :contact_auctions, dependent: :destroy
  belongs_to :auction
  belongs_to :company

end
