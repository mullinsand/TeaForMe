class Tea < ApplicationRecord
  validates_presence_of :title,
                        :description,
                        :brew_time,
                        :temperature

  has_many :subscriptions_teas
  has_many :subscriptions, through: :subscriptions_teas
end
