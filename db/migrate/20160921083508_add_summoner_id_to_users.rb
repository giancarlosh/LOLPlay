class AddSummonerIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :summoner_id, :integer
  end
end
