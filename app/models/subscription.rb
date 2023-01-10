class Subscription < ApplicationRecord
  validates_presence_of :title,
                        :price,
                        :frequency
  has_many :customers_subscriptions
  has_many :customers, through: :customers_subscriptions
  has_many :subscriptions_teas
  has_many :teas, through: :subscriptions_teas
end
