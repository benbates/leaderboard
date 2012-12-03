class Game < ActiveRecord::Base
  attr_accessible :game_type_id, :date
  
	has_many :players, :through => :results
	has_many :results, :dependent => :destroy
	belongs_to :game_type
end
