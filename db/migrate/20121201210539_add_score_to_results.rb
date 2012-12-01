class AddScoreToResults < ActiveRecord::Migration
  def change
    add_column :results, :score, :int
  end
end
