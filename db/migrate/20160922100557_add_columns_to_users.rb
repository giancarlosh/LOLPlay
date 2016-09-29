class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :matches, :integer, :default => 0
  end
end
