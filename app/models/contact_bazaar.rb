class ContactBazaar < ApplicationRecord

  with_options presence: true do
    validates :message
#    validates :order_bazaar_id
  end

  belongs_to :order_bazaar
#  belongs_to :company
#  belongs_to :user
end
