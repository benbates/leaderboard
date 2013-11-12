class Game < ActiveRecord::Base
  attr_accessible :game_type_id, :date, :comment
    
	has_many :players, :through => :results
	has_many :results, :dependent => :destroy
  accepts_nested_attributes_for :results
	belongs_to :game_type
	scope :ordered, :order => 'created_date'

  after_save :update_relationships

  def update_relationships
    puts "After Save Game"
  end

end
