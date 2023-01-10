class Api::V1::CustomerSubscriptionsController < ApplicationController
  include ExceptionHandler
  
  def create
    customer = Customer.find_by(api_key: params[:api_key])
    raise ActiveRecord::RecordNotFound.new "Couldn't find customer with api key #{params[:api_key]}" if customer.nil?

    subscription = Subscription.find(params[:id])
    customer_sub = CustomersSubscription.new(customer_id: customer, subscription_id: subscription)
    
    if customer_sub.save
      render json: { message: "Customer successfully subscribed"}
    end
    #can't have duplicates: logic needed
  end
end