class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.integer :price
      t.integer :frequency

      t.timestamps
    end
  end
end
