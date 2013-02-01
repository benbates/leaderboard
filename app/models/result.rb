class Result < ActiveRecord::Base
  attr_accessible :game_id, :player_id, :score, :winner, :opponent_id
  
	belongs_to :game	
	belongs_to :player
	
	after_save    :update_counter_cache
  after_destroy :update_counter_cache

  def update_counter_cache
    self.player.win_count = Result.count(:conditions => ["winner = ? AND player_id = ?", true, self.player.id])
    if self.player.games.count > 0 
      self.player.win_percent = self.player.win_count.to_f/(self.player.results.count(:conditions => {:winner => false}) + player.win_count)
    else  
      self.player.win_percent = '0'
    end
    self.player.save
  end

end
