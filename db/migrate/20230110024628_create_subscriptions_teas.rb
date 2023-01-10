class CreateSubscriptionsTeas < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions_teas do |t|
      t.references :teas, null: false, foreign_key: true
      t.references :subscriptions, null: false, foreign_key: true

      t.timestamps
    end
  end
end
