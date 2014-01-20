module PlayersHelper
  
  def points_for(player)
    points = player.points_for
    points > 0 ? points/total_games(player) : 0
  end
         
  def points_against(player)
    points = player.points_against
    points > 0 ? points/total_games(player) : 0
  end

  def total_games(player)
    player.win_count + player.loss_count
  end
  
  def diff(player)
    points_for(player) - points_against(player)
  end
    
  def win_percent(player)
    if player.win_count > 0 
      number_with_precision(player.win_count.to_f/(player.loss_count + player.win_count), :precision => 3)
    else  
      0.000
    end
  end
  
  def streak(player)
    if player.results.count == 0
      "Play a game"
    else
      streak_number = 0
      streak_results = player.results.order('created_at DESC')
      result = streak_results.first.winner 
      streak_results.each do |streak|
        if streak.winner != result then
          break
        end
        streak_number += 1
      end
      if result == true
        "Won #{streak_number}"
      else
        "Lost #{streak_number}"
      end
    end 
  end
  
  def curr_streak(player)
    if player.results.count == 0
      curr_streak = false
    else
      curr_streak = player.results.order('created_at DESC').first.winner
    end
  end

  def initialize_relationships

    players = Player.all
    @players.each do | player |
      opponents = @players
      opponents.each do | opponent |
        if opponent != player
          total_games = player.results.where(:opponent_id => opponent.id).count
          win_count =  player.results.where(:opponent_id => opponent.id,  :winner => true).count
          loss_count = total_games - win_count
          points_for = player.results.where(:opponent_id => opponent.id).sum(:score)
          points_against = Result.where(:player_id => opponent.id, :opponent_id => player.id).sum(:score)

          Relationship.create :player_id => player.id,
                              :opponent_id => opponent.id,
                              :win_count => win_count,
                              :loss_count => loss_count,
                              :points_for => points_for,
                              :points_against => points_against
         end
      end
    end
  end
end
