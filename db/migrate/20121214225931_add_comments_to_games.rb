class AddCommentsToGames < ActiveRecord::Migration
  def change
    add_column :games, :comment, :string
  end
end
