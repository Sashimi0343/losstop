class ContactAuction < ApplicationRecord
  with_options presence: true do
    validates :message
  end

  has_many :notice_companys, dependent: :destroy

  belongs_to :order_auction
  belongs_to :company, optional: true
  belongs_to :user, optional: true
end
