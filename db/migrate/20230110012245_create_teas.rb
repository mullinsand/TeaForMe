class CreateTeas < ActiveRecord::Migration[6.0]
  def change
    create_table :teas do |t|
      t.string :title
      t.string :description
      t.string :brew_time
      t.integer :temperature

      t.timestamps
    end
  end
end
