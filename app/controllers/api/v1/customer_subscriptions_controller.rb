class Api::V1::CustomerSubscriptionsController < ApplicationController
  include ExceptionHandler
  
  def create
    customer = find_customer

    subscription = Subscription.find(customer_subscriptions_params[:sub_id])
    return render json: { message: "Customer already subscribed"} if already_subscribed?(customer)

    customer_sub = CustomersSubscription.new(customer_id: customer.id, subscription_id: subscription.id)

    if customer_sub.save
      render json: { message: "Customer successfully subscribed"}
    end
  end

  def update
    customer = find_customer

    subscription = Subscription.find(customer_subscriptions_params[:sub_id])

    customer_sub = CustomersSubscription.find_by(customer_id: customer.id, subscription_id: subscription.id)

    if customer_subscriptions_params[:status] == 'cancelled'
      update_customer_sub(customer_sub, 'Customer successfully unsubscribed')
    elsif customer_subscriptions_params[:status] == 'active'
      update_customer_sub(customer_sub, 'Customer successfully resubscribed')
    else
      render json: { message: 'Invalid status, no changes made'}
    end
  end

  private

  def already_subscribed?(customer)
    !customer.subscriptions.find_by(id: customer_subscriptions_params[:sub_id]).nil?
  end

  def customer_subscriptions_params
    params.permit(:sub_id, :api_key, :status)
  end

  def update_customer_sub(customer_sub, message)
    customer_sub.update(status: customer_subscriptions_params[:status])
    render json: { message: message}
  end
end