FactoryBot.define do
  factory :contact_auction do
    message { Faker::Lorem.sentence }

    association :user
    association :company
    association :order_auction
  end
end
