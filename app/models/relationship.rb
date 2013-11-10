class Relationship < ActiveRecord::Base
  attr_accessible :player_id, :opponent_id, :win_count, :loss_count, :points_for, :points_against, :win_percent

  belongs_to :player

end
