class Player < ActiveRecord::Base
  attr_accessible :name, :points_against, :win_count, :ladder_pos, :retired
  
  validates :name, presence: true 
  
	has_many :games, :through => :results
  has_many :results

  def is_not_retired
    self.retired == true ? false : true
  end

end
