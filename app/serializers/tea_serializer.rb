class TeaSerializer
  include JSONAPI::Serializer

  attributes :title, :description, :brew_time, :temperature, :created_at, :updated_at
  has_many :subscriptions
end