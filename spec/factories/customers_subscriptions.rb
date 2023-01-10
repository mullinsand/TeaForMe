FactoryBot.define do
  factory :customers_subscription do
    customers { nil }
    subscriptions { nil }
    status { 1 }
  end
end
