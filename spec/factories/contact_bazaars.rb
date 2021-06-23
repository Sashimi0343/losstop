FactoryBot.define do
  factory :contact_bazaar do
    message { Faker::Lorem.sentence }

    association :user
    association :company
    association :order_bazaar
  end
end
