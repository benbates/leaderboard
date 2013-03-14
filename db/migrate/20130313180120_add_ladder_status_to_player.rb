class AddLadderStatusToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :ladder_stat, :string, :default => ""
  end
end
