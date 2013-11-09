module StaticPagesHelper
  def set_ladder_pos
    ladderpos = 1
    players = Player.all(:order => "win_percent ASC")
    players.each do |player|
      player.ladder_pos = ladderpos
      ladderpos += 1
    end
  end
end
