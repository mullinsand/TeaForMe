class RemoveSubscriptionsFromTeas < ActiveRecord::Migration[6.0]
  def change
    remove_reference :teas, :subscriptions, null: false, foreign_key: true
  end
end
