module PlayersHelper

  def losses(player, game_type)
    if game_type == 0
      player.results.count(:conditions => { :winner => false, :game_type_id => '*' })      
    else
      player.results.count(:conditions => { :winner => false, :game_type_id => game_type })
    end
  end
    
  def points_for(player, game_type)
    if game_type == 0
      player.results.sum(:score)  
    else
    end
  end
         
  def points_against(player, game_type)
    if game_type == 0
      Result.sum(:score, :conditions => { :opponent_id => player.id })
    else
    end
  end
  
  def win_count(player, game_type)
    if game_type == 0 
      self.results.count(:conditions => { :winner => true })
    end
  end
  
    
  def win_percent(player, game_type)
    if game_type == 0
      if self.games.count > 0 
        self.win_count.to_f/(self.results.count(:conditions => {:winner => false}) + self.win_count)
      else  
        0.00
      end
    end
  end
  
end
