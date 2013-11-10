class CreateRelationships < ActiveRecord::Migration
  def up

    create_table :relationships do |t|
      t.integer :player_id
      t.integer :opponent_id
      t.integer :win_count 
      t.integer :loss_count
      t.integer :points_for  
      t.integer :points_against  
      t.float   :win_percent

      t.timestamps
    end


    players = Player.all
    players.each do | player |
      opponents = players
      opponents.each do | opponent |
        if opponent != player
          total_games = player.results.where(:opponent_id => opponent.id).count
          win_count =  player.results.where(:opponent_id => opponent.id,  :winner => true).count
          loss_count = total_games - win_count
          points_for = player.results.where(:opponent_id => opponent.id).sum(:score)
          points_against = Result.where(:player_id => opponent.id, :opponent_id => player.id).sum(:score)
          if win_count > 0
            win_percent = (win_count.to_f/(loss_count + win_count))
          else  
            win_percent = 0.000
          end
          Relationship.create :player_id => player.id,
                              :opponent_id => opponent.id,
                              :win_count => win_count,
                              :loss_count => loss_count,
                              :points_for => points_for,
                              :points_against => points_against,
                              :win_percent => win_percent
         end
      end
    end    
  end

  def down
    drop_table :relationships
  end
end
