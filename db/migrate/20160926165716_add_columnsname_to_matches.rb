class AddColumnsnameToMatches < ActiveRecord::Migration[5.0]
  def change
  	add_column :matches, :user1, :string
    add_column :matches, :user2, :string
  end
end
