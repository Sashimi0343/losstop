FactoryBot.define do
  factory :order_bazaar do
    quantity   { '100' }
    active     { "active" }

    association :user
    association :company
    association :bazaar
  end
end
