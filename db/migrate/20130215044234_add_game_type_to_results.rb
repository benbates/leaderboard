class AddGameTypeToResults < ActiveRecord::Migration
  def change
    add_column :results, :game_type_id, :int
  end
end
