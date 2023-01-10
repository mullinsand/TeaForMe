class SubscriptionsTea < ApplicationRecord
  belongs_to :teas
  belongs_to :subscriptions
end
