class AddLadderPosToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :ladder_pos, :int
  end
end
