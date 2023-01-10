class Api::V1::SubscriptionsController < ApplicationController
  include ExceptionHandler
  
  def index
    customer = Customer.find_by(api_key: params[:api_key])
    render json: SubscriptionSerializer.new(customer.subscriptions)
  end
end