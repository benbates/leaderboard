class Result < ActiveRecord::Base
  attr_accessible :game_id, :player_id, :score, :winner, :opponent_id
  
	belongs_to :game	
	belongs_to :player

  before_save :default_values

  after_save :update_counter_cache
  after_destroy :update_counter_cache
  
  def default_values
    self.score ||= 0
  end

  def update_counter_cache
    self.player.win_count = Result.count(:conditions => ["winner = ? AND player_id = ?", true, self.player.id])
    self.player.points_for = self.player.results.sum(:score)
    if self.player.games.count > 0
      self.player.win_percent = self.player.win_count.to_f/(self.player.results.count(:conditions => {:winner => false}) + player.win_count)
    else
      self.player.win_percent = 0.00
    end
    self.player.save
    if self.winner == true # && (self.player.ladder_pos == opponent.ladder_pos - 2 || self.player.ladder_pos == opponent.ladder_pos - 1)
      new_pos = opponent.ladder_pos
      old_pos = self.player.ladder_pos
      self.player.ladder_pos = new_pos
      opponent.ladder_pos = old_pos
      self.player.save
      opponent.save
    end
  end

  def opponent
    Player.find(self.opponent_id)
  end
  
end
