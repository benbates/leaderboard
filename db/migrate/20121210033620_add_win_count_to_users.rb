class AddWinCountToUsers < ActiveRecord::Migration
  def change
    add_column :players, :win_count, :int
  end
end
