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
    curr_streak = player.results.order('created_at DESC').first.winner
  end
      
end
