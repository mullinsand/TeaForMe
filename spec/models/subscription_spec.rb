require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'relationships' do
    it { should have_many(:customers_subscriptions) }
    it { should have_many(:customers).through(:customers_subscriptions) }
    it { should have_many(:subscriptions_teas) }
    it { should have_many(:teas).through(:subscriptions_teas) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:frequency) }
  end
end
