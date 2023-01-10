class RemoveCustomersFromSubscriptions < ActiveRecord::Migration[6.0]
  def change
    remove_reference :subscriptions, :customers, null: false, foreign_key: true
  end
end
