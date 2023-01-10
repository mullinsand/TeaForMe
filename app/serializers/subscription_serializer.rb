class SubscriptionSerializer
  include JSONAPI::Serializer

  attributes :title, :price, :frequency, :created_at, :updated_at
  has_many :teas
end