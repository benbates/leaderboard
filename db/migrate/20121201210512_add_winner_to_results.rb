class AddWinnerToResults < ActiveRecord::Migration
  def change
    add_column :results, :winner, :boolean
  end
end
