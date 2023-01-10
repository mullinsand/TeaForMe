class Api::V1::SubscriptionsController < ApplicationController
  include ExceptionHandler
  
  def index
    customer = Customer.find_by(api_key: params[:api_key])
    raise ActiveRecord::RecordNotFound.new "Couldn't find customer with api key #{params[:api_key]}" if customer.nil?

    render json: SubscriptionSerializer.new(customer.subscriptions)
  end
end