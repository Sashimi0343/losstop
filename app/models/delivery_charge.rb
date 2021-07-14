class DeliveryCharge < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '着払い' },
    { id: 2, name: '発送者負担' }
  ]

  include ActiveHash::Associations
  has_many :bazaars
  has_many :auctions
end
