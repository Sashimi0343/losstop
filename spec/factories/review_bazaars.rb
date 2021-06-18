FactoryBot.define do
  factory :review_bazaar do
    comment     { Faker::Lorem.sentence }

    association :user
    association :company
    association :bazaar
  end
end
