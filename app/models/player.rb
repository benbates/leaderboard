class Player < ActiveRecord::Base
  attr_accessible :name, :points_against, :win_count, :ladder_pos, :retired
  
  validates :name, presence: true 
  
	has_many :games, :through => :results
  has_many :results
  after_initialize :init

  def init
    
    self.win_percent ||= 0.00
    self.points_for ||= 0
    self.ladder_stat ||= ""
    self.retired ||= false 
    self.win_count ||= 0
    self.loss_count ||= 0 
    self.points_against ||= 0

  end

  def is_not_retired
    self.retired == true ? false : true
  end

end
