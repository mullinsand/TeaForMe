class ApplicationController < ActionController::API
  def find_customer
    customer = Customer.find_by(api_key: params[:api_key])
    raise ActiveRecord::RecordNotFound.new "Couldn't find customer with api key #{params[:api_key]}" if customer.nil?
    customer
  end
end
