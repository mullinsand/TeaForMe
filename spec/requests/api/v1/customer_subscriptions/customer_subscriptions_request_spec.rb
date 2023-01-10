require 'rails_helper'

describe 'POST a customer_subscription' do
  describe 'subscribes a customer to an already existing subscription' do
    context 'customer api key and subscription exists' do
      it 'creates a new customer_subscription with default status of active' do
        customer = create(:customer)
        sub1 = create(:subscription)
        params = {
          api_key: customer.api_key,
          sub_id: sub1.id
        }
        
        post '/api/v1/customer_subscriptions', params: params
  
        expect(response).to have_http_status(200)
        expect(json[:message]).to eq("Customer successfully subscribed")
        expect(customer.subscriptions).to eq([sub1])
      end
    end

    context 'incorrect subsciption id' do
      it 'returns a JSON object with an error message' do
        customer = create(:customer)
        sub1 = create(:subscription)
        params = {
          api_key: customer.api_key,
          sub_id: 123456789
        }
        
        post '/api/v1/customer_subscriptions', params: params
  
        expect(response).to have_http_status(404)
        expect(json[:message]).to eq("Couldn't find subscription with id 123456789")
      end
    end
  
    context 'incorrect customer api key' do
      it 'returns an JSON object with an error message' do
        customer = create(:customer)
        sub1 = create(:subscription)
        params = {
          api_key: "123456789",
          sub_id: sub1.id
        }
        
        post '/api/v1/customer_subscriptions', params: params
  
        expect(response).to have_http_status(404)
        expect(json[:message]).to eq("Couldn't find customer with api key 123456789")
      end
    end
  end
end