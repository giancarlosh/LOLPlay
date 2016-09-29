class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.string :name
      t.integer :winner_id
      t.integer :loser_id
      t.datetime :date

      t.timestamps
    end
  end
end
