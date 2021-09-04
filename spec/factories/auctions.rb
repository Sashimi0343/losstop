FactoryBot.define do
  factory :auction do
    title                 { Faker::Lorem.sentence }
    description           { Faker::Lorem.sentence }
    price                 { 10_000 }
    deadline              { Faker::Date.birthday(min_age: 18, max_age: 65) }
    active                { "active" }
    category_id           { 1 }
    delivery_charge_id    { 1 }

    association :user
  end
end
