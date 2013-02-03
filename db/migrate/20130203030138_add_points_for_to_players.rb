class AddPointsForToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :points_for, :int
  end
end
