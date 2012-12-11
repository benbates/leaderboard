require 'spec_helper'

describe Game do

  let(:game) { FactoryGirl.create(:game) }
  subject { game }

  it { should respond_to(:game_type_id) }

  it { should be_valid }

  describe "when game_type_id is not present" do
    before { game.game_type_id = " " }
    it { should_not be_valid }
  end
  
  describe "when a game is deleted" do
    # results are deleted
    # player win_counts are adjusted
    
  end
  
end