class Customer < ApplicationRecord
  validates_presence_of :first_name,
                       :last_name,
                       :email,
                       :address
  has_many :customers_subscriptions
  has_many :subscriptions, through: :customers_subscriptions
end
