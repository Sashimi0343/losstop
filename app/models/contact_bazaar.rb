class ContactBazaar < ApplicationRecord

  belongs_to :order_bazaar
  belongs_to :company
  belongs_to :user
end
