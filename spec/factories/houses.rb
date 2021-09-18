FactoryBot.define do
  factory :house do
    house_name { Faker::Restaurant.name }
    city { Faker::Address.city }
    address { Faker::Address.full_address }
    description_short { Faker::Restaurant.description }
    description_long { Faker::Lorem.paragraphs(number: 1) }
    price { Faker::Number.decimal(l_digits: 2) }
  end
end
