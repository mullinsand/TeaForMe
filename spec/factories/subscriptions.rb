FactoryBot.define do
  factory :subscription do
    title { Faker::Commerce.product_name }
    price { Faker::Number.between(from: 100, to: 100000) }
    frequency { Faker::Number.between(from: 1, to: 52) }
    after(:create) do |subscription|
      subscription.teas = FactoryBot.create_list(:tea, 3)
    end
  end
end
