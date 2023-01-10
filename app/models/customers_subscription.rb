class CustomersSubscription < ApplicationRecord
  enum status: { active: 0, cancelled: 1 }

  belongs_to :customers
  belongs_to :subscriptions
end
