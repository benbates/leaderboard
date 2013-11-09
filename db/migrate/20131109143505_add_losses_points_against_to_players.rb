class AddLossesPointsForAndPointsAgainstToPlayers < ActiveRecord::Migration
  def up
    add_column :players, :loss_count, :int
    add_column :players, :points_against, :int

    players = Player.all
    players.each do | player |
      player.loss_count = player.results.count(:conditions => { :winner => false })
      player.points_against = Result.sum(:score, :conditions => { :opponent_id => player.id })
      player.save
    end
  end

  def down
    remove_column :players, :loss_count
    remove_column :players, :points_against
  end
end
