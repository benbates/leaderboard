class Player < ActiveRecord::Base
  attr_accessible :name, :points_against, :win_count
  
  validates :name, presence: true 
  
	has_many :games, :through => :results
  has_many :results
    
  def points_for
    self.results.sum(:score) 
  end
  
  def points_against
    Result.sum(:score, :conditions => { :opponent_id => self.id })
  end
  
end
