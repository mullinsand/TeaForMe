class Api::V1::SubscriptionsController < ApplicationController
  include ExceptionHandler
  
  def index
    customer = find_customer

    render json: SubscriptionSerializer.new(customer.subscriptions)
  end
end