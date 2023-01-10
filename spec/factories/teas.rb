FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Lorem.sentence }
    brew_time { Faker::Number.between(from: 1, to: 20) }
    temperature { Faker::Number.between(from: 100, to: 250) }
  end
end
