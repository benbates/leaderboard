class Player < ActiveRecord::Base
  attr_accessible :name
  
	has_many :games
  has_many :results, :through => :games
end
