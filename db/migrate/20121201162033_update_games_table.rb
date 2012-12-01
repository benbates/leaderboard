class UpdateGamesTable < ActiveRecord::Migration
  def up
    add_column :games, :date, :string
    rename_column :games, :type, :game_type
  end

  def down
    remove_column :games, :date
    rename_column :games, :game_type, :type
  end
end
