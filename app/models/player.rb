class Player < ActiveRecord::Base
  attr_accessible :name, :points_against, :win_count, :ladder_pos
  
  validates :name, presence: true 
  
	has_many :games, :through => :results
  has_many :results

end
