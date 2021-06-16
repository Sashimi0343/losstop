class ContactBazaar < ApplicationRecord

  with_options presence: true do
    validates :message
  end


  belongs_to :order_bazaar
  belongs_to :user, optional: true
  belongs_to :company, optional: true
end
