module GameTypesHelper

  def all_game_types
    @all_game_types = ['All']
    GameType.all.each do |gt|
      @all_game_types.push gt.name
    end
    @all_game_types
  end
end
