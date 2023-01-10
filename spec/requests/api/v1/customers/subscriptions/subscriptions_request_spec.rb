require 'rails_helper'

describe 'GET all subscriptions for a specific customer' do
  context 'customer api key exists' do
    context 'one or more subscriptions' do
      it 'returns a JSON object with an array that contains each subscription, active and cancelled' do
        customer = create(:customer)
        customer_active_subs = create_list(:customers_subscription, 5, customer: customer)
        customer_cancelled_subs = create_list(:customers_subscription, 5, customer: customer, status: 1)

        params = {
          'api_key'=> customer.api_key
        }

        get '/api/v1/customers/subscriptions'

        json
      end
    end

    context 'no subscriptions' do
      it 'returns a JSON object with an empty array' do

      end
    end
  end

  context 'incorrect customer api key' do
    it 'returns an JSON object with an error message' do

    end
  end
end