FactoryBot.define do
  factory :order_auction do
    title         { Faker::Lorem.sentence }
    description   { Faker::Lorem.sentence }
    price         { '1000' }
    active        { "active" }

    association :user
    association :company
    association :auction

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
