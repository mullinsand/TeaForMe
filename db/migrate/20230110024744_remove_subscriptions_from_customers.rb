class RemoveSubscriptionsFromCustomers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :customers, :subscriptions, null: false, foreign_key: true
  end
end
