class AddColumnsToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :user1_id, :integer
    add_column :matches, :user2_id, :integer
  end
end
