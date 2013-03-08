class StaticPagesController < ApplicationController
  def ladder
    @players = Player.all(:order => 'ladder_pos ASC')
  end
end
