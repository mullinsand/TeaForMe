FactoryBot.define do
  factory :customers_subscription do
    customer
    subscription
    status { 0 }
  end
end
