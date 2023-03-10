require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe 'relationships' do
    it { should have_many(:subscriptions_teas) }
    it { should have_many(:subscriptions).through(:subscriptions_teas) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:brew_time) }
    it { should validate_presence_of(:temperature) }
  end
end
