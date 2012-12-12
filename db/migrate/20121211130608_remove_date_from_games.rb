class RemoveDateFromGames < ActiveRecord::Migration
  def up
    remove_column :games, :date
  end

  def down
    add_column :games, :date, :string
  end
end
