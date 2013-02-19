class AddLadderRankToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :ladder_rank, :int
  end
end
