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
  
  def win_count
    self.results.count(:conditions => { :winner => true })
  end
  
  def win_percent
    if self.games.count > 0 
      self.win_count.to_f/(self.results.count(:conditions => {:winner => false}) + self.win_count)
    else  
      0.00
    end
  end
  
end
