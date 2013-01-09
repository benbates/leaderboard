class AddOpponentIdToResults < ActiveRecord::Migration
  def change
    add_column :results, :opponent_id, :int
  end
end
