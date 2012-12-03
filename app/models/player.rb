class Player < ActiveRecord::Base
  attr_accessible :name
  
	has_many :games, :through => :results
  has_many :results
end
