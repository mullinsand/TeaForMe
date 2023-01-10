require 'rails_helper'

describe 'GET all subscriptions for a specific customer' do
  context 'customer api key exists' do
    context 'one or more subscriptions' do
      it 'returns a JSON object with an array that contains each subscription, active and cancelled' do
        customer = create(:customer)
        customer_active_subs = create_list(:customers_subscription, 3, customer: customer)
        customer_cancelled_sub = create(:customers_subscription, customer: customer, status: 1)
        
        params = {
          api_key: customer.api_key
        }
        
        get api_v1_customer_subscriptions_path, params: params
        
        expect(response).to have_http_status(200)
        expect(json[:data]).to be_an(Array)
        expect(json[:data].first[:type]).to eq("subscription")
        expect(json[:data].last[:id]).to eq(customer_cancelled_sub.subscription.id.to_s)
      end
    end

    context 'no subscriptions' do
      it 'returns a JSON object with an empty array' do
        customer = create(:customer)
        params = {
          api_key: customer.api_key
        }
        
        get api_v1_customer_subscriptions_path, params: params

        expect(response).to have_http_status(200)
        expect(json[:data]).to be_an(Array)
        expect(json[:data].empty?).to eq(true)
      end
    end
  end

  context 'incorrect customer api key' do
    it 'returns an JSON object with an error message' do
      customer = create(:customer)
      params = {
        api_key: "123456789"
      }
      
      get api_v1_customer_subscriptions_path, params: params

      expect(response).to have_http_status(404)
      expect(json[:message]).to eq("Couldn't find customer with api key 123456789")
    end
  end
end