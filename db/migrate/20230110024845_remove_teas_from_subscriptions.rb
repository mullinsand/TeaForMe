class RemoveTeasFromSubscriptions < ActiveRecord::Migration[6.0]
  def change
    remove_reference :subscriptions, :teas, null: false, foreign_key: true
  end
end
