class Api::V1::CustomerSubscriptionsController < ApplicationController
  include ExceptionHandler
  
  def create
    customer = Customer.find_by(api_key: params[:api_key])
    raise ActiveRecord::RecordNotFound.new "Couldn't find customer with api key #{params[:api_key]}" if customer.nil?

    subscription = Subscription.find(params[:sub_id])
    return render json: { message: "Customer already subscribed"} if already_subscribed?(customer)
    customer_sub = CustomersSubscription.new(customer_id: customer.id, subscription_id: subscription.id)

    if customer_sub.save
      render json: { message: "Customer successfully subscribed"}
    end
    #can't have duplicates: logic needed
  end

  private

  def already_subscribed?(customer)
    !customer.subscriptions.find_by(id: params[:sub_id]).nil?
  end
end