module PlayersHelper
  
  def points_against(player)
    score = 0
    player.games.each do |game|
      game.results.each do |result|
        if result.player_id != player.id 
          score = score +result.score
        end
      end
    end
    score
  end
  
end
