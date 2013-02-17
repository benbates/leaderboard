module PlayersHelper

  def losses(player, game_type)
    if game_type == 0
      player.results.count(:conditions => { :winner => false })      
    else
      player.results.count(:conditions => { :winner => false, :game_type_id => game_type })
    end
  end
    
  def points_for(player, game_type)
    if game_type == 0
      player.results.sum(:score)  
    else
      player.results.sum(:score, :conditions => { :game_type_id => game_type })  
    end
  end
         
  def points_against(player, game_type)
    if game_type == 0
      Result.sum(:score, :conditions => { :opponent_id => player.id })
    else
      Result.sum(:score, :conditions => { :opponent_id => player.id, :game_type_id => game_type })
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
  
end
