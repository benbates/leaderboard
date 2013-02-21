module PlayersHelper

  def losses(player, game_type)
    if game_type == 0
      player.results.count(:conditions => { :winner => false })      
    else
      player.results.count(:conditions => { :winner => false, :game_type_id => game_type })
    end
  end
  
  def points_for(player, game_type)
    games = losses(player, game_type) + win_count(player, game_type)
    if game_type == 0
      points = player.results.sum(:score) 
      points > 0 ? points/games : 0
    else
      points = player.results.sum(:score, :conditions => { :game_type_id => game_type }) 
      points > 0 ? points/games : 0
    end
  end
         
  def points_against(player, game_type)
    games = losses(player, game_type) + win_count(player, game_type)
    if game_type == 0
      points = Result.sum(:score, :conditions => { :opponent_id => player.id })
      points > 0 ? points/games : 0
    else
      points = Result.sum(:score, :conditions => { :opponent_id => player.id, :game_type_id => game_type })
      points > 0 ? points/games : 0
    end
  end
  
  def win_count(player, game_type)
    if game_type == 0 
      player.results.count(:conditions => { :winner => true })
    else
      player.results.count(:conditions => { :winner => true, :game_type_id => game_type })
    end
  end
  
    
  def win_percent(player, game_type)
    @losses = losses(player, game_type)
    @wins = win_count(player, game_type)
    if game_type == 0
      if @wins > 0 
        number_with_precision(@wins.to_f/(@losses + @wins), :precision => 3)
      else  
        0.000
      end
    else
      if @wins > 0 
        number_with_precision(@wins.to_f/(@losses + @wins), :precision => 3)
      else  
        0.000
      end        
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
end
