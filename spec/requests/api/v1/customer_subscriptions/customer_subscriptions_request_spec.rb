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

    context 'customer already subscriped to this subscription' do
      it 'does not create another customer_subscription and instead returns message' do
        customer = create(:customer)
        sub1 = create(:subscription)
        customer.subscriptions << sub1
        expect(customer.subscriptions.length).to eq(1)

        params = {
          api_key: customer.api_key,
          sub_id: sub1.id
        }
        
        post '/api/v1/customer_subscriptions', params: params
        expect(response).to have_http_status(200)
        expect(json[:message]).to eq("Customer already subscribed")
        expect(customer.subscriptions.length).to eq(1)
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
        expect(json[:message]).to eq("Couldn't find Subscription with 'id'=123456789")
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

describe 'PUT/PATCH customer_subscription' do
  describe 'allows for cancelling (or just changing the status) of a subscription' do
    context 'customer api key and subscription exists' do
      contex 'status is set to cancelled' do
        it 'changes the status of that customer_subscription to cancelled' do
          customer = create(:customer)
          sub1 = create(:subscription)
          customer.subscriptions << sub1
          cust_sub = customer.customers_subscription.first
          expect(cust_sub.status).to eq('active')
          params = {
            api_key: customer.api_key,
            sub_id: sub1.id,
            status: 'cancelled'
          }
          
          patch '/api/v1/customer_subscriptions', params: params

          expect(response).to have_http_status(200)
          expect(json[:message]).to eq("Customer successfully unsubscribed")
          expect(cust_sub.status).to eq('cancelled')
        end
      end

      contex 'status is set to active' do
        it 'changes the status of that customer_subscription to active' do
          customer = create(:customer)
          sub1 = create(:subscription)
          customer.subscriptions << sub1
          customer.customers_subscription.first.status = 'cancelled'
          cust_sub = customer.customers_subscription.first
          expect(cust_sub.status).to eq('cancelled')
          params = {
            api_key: customer.api_key,
            sub_id: sub1.id,
            status: 'active'
          }
          
          patch '/api/v1/customer_subscriptions', params: params

          expect(response).to have_http_status(200)
          expect(json[:message]).to eq("Customer successfully subscribed")
          expect(cust_sub.status).to eq('active')
        end
      end
      contex 'status is set to something else' do
        it 'returns a JSON response that no changes were made' do
          customer = create(:customer)
          sub1 = create(:subscription)
          customer.subscriptions << sub1
          cust_sub = customer.customers_subscription.first
          expect(cust_sub.status).to eq('active')
          params = {
            api_key: customer.api_key,
            sub_id: sub1.id,
            status: 'asdkjhfihuasdf'
          }
          
          patch '/api/v1/customer_subscriptions', params: params

          expect(response).to have_http_status(200)
          expect(json[:message]).to eq("Invalid status, no changes made")
          expect(cust_sub.status).to eq('active')
        end
      end
    end
  end
end