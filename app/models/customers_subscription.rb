class CustomersSubscription < ApplicationRecord
  enum status: { active: 0, cancelled: 1 }

  validates_presence_of :status

  belongs_to :customer
  belongs_to :subscription
end
