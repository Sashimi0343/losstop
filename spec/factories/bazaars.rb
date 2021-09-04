FactoryBot.define do
  factory :bazaar do
    title                 { Faker::Lorem.sentence }
    description           { Faker::Lorem.sentence }
    price                 { 10_000 }
    stock                 { 100 }
    deadline              { Faker::Date.birthday(min_age: 18, max_age: 65) }
    active                { "active" }
    category_id           { 1 }
    delivery_charge_id    { 1 }

    association :company

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
