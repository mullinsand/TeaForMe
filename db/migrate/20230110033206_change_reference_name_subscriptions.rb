class ChangeReferenceNameSubscriptions < ActiveRecord::Migration[6.0]
  def change
    remove_reference :subscriptions_teas, :subscriptions, null: false
    remove_reference :subscriptions_teas, :teas, null: false
    add_reference :subscriptions_teas, :subscription, null: false, foreign_key: true
    add_reference :subscriptions_teas, :tea, null: false, foreign_key: true
    remove_reference :customers_subscriptions, :subscriptions, null: false
    remove_reference :customers_subscriptions, :customers, null: false
    add_reference :customers_subscriptions, :subscription, null: false, foreign_key: true
    add_reference :customers_subscriptions, :customer, null: false, foreign_key: true
  end
end
