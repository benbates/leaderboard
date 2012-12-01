class Game < ActiveRecord::Base
  attr_accessible :game_type
  
	has_many :players, :through => :results
	has_many :results
end
