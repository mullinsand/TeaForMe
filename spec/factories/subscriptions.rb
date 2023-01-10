FactoryBot.define do
  factory :subscription do
    title { Faker::Commerce.product_name }
    price { Faker::Number.between(from: 100, to: 100000) }
    frequency { Faker::Number.between(from: 1, to: 52) }
  end
end
