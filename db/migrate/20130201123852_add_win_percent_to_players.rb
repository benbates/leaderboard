class AddWinPercentToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :win_percent, :float
  end
end
