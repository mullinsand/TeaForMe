class AddRelationshipToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_reference :customers, :subscriptions, null: false, foreign_key: true
  end
end
