FactoryBot.define do
  factory :order_bazaar do

    quantity           { '100' }

    association :user
    association :bazaar
  end
end
