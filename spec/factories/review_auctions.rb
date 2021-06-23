FactoryBot.define do
  factory :review_auction do
    comment     { Faker::Lorem.sentence }

    association :user
    association :company
    association :auction
  end
end
