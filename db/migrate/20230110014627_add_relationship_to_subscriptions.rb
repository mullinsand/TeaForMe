class AddRelationshipToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_reference :subscriptions, :customers, null: false, foreign_key: true
    add_reference :subscriptions, :teas, null: false, foreign_key: true
  end
end
