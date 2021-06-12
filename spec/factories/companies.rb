FactoryBot.define do
  factory :company do
    name                     { Faker::Name.initials(number: 4) }
    email                    { Faker::Internet.free_email }
    password                 { 'test100' }
    password_confirmation    { password }
    president                { Gimei.kanji }
    profile                  { Faker::Lorem.sentence }
    phone                    { '08012345678' }
    prefecture_id            { 1 }
    city                     { Gimei.city.kanji }
    address                  { '番地〜建物〜部屋番号' }
    homepage                 { Faker::Lorem.sentence }
  end
end
