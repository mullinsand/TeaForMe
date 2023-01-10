class CreateCustomersSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :customers_subscriptions do |t|
      t.references :customers, null: false, foreign_key: true
      t.references :subscriptions, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
