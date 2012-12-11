class AddDefaultToPlayerWinCount < ActiveRecord::Migration
  def change
    change_column_default(:players, :win_count,  0)
  end
end
