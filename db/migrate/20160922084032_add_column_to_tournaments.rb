class AddColumnToTournaments < ActiveRecord::Migration[5.0]
  def change
    add_column :tournaments, :size, :integer
  end
end
