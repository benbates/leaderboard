class RenameGameTypeColumnOnGam < ActiveRecord::Migration
  def up
    rename_column :games, :game_type, :game_type_id
  end

  def down
    rename_column :games, :game_type_id, :game_type
  end
end
