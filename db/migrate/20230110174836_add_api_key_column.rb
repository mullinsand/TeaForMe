class AddApiKeyColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :api_key, :string
  end
end
