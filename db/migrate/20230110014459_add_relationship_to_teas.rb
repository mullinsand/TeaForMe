class AddRelationshipToTeas < ActiveRecord::Migration[6.0]
  def change
    add_reference :teas, :subscriptions, null: false, foreign_key: true
  end
end
