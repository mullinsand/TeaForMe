class ChangeDefaultValueForStatusInCustomersSubscriptions < ActiveRecord::Migration[6.0]
  def change
    change_column_default :customers_subscriptions, :status, 0
  end
end
