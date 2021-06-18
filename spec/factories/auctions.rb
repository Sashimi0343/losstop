FactoryBot.define do
  factory :auction do

    title                 { Faker::Lorem.sentence }
    description           { Faker::Lorem.sentence }
    price                 { 10_000 }
    stock                 { 100 }
    category_id           { 1 }
    delivery_charge_id    { 1 }
    days_to_ship_id       { 1 }
    association :user

  end
end
