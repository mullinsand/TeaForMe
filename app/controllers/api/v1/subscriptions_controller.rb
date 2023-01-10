class Api::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find_by(api_key: params[:api_key])
    render json: SubscriptionsSerializer.new(customer.subscriptions)
  end
end