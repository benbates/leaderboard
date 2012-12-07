class Player < ActiveRecord::Base
  attr_accessible :name, :points_against
  
	has_many :games, :through => :results
  has_many :results
  
  def points_against
    score = 0
    self.games.each do |game|
      game.results.each do |result|
        if result.player_id != self.id 
          score = score +result.score
        end
      end
    end
    score
  end
  
end
