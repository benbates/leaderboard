class RemoveLadderRankFromPlayer < ActiveRecord::Migration
  def up
    remove_column :players, :ladder_rank
  end

  def down
    add_column :players, :ladder_rank, :string
  end
end
