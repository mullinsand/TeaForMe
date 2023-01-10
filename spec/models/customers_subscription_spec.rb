require 'rails_helper'

RSpec.describe CustomersSubscription, type: :model do
  describe 'relationships' do
    it { should belong_to :customers }
    it { should belong_to :subscriptions }
  end

  describe 'validations' do
    it { should validate_presence_of(:status) }
  end
end
