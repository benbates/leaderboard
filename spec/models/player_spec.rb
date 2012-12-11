require 'spec_helper'

describe Player do

  let(:player) { FactoryGirl.create(:player) }
  let(:game) { FactoryGirl.create(:game) }  
  subject { player }

  it { should respond_to(:name) }
  it { should respond_to(:results) }
  it { should respond_to(:games) }
  it { should be_valid }

  describe "when name is not present" do
    before { player.name = " " }
    it { should_not be_valid }
  end
  
  describe "with results" do
    let!(:result_one) { player.results.create game_id: game.id, winner: true, score: 55 }
    before do
      result_one.player.reload
      @orig_win_count = result_one.player.win_count
    end

    describe "when new result is added" do
      # player.win_count should increase by 1
      before do
        @result_two = player.results.create! game_id: game.id, winner: true, score: 55  
        result_one.player.reload  
      end
      it { result_one.player.win_count.should == (@orig_win_count + 1) }
    end
  
    describe "when result is saved" do
      # player.win_count should remain the same
      before do
        result_one.save
        result_one.player.reload
      end
      it { result_one.player.win_count.should == @orig_win_count }
    end
  
    describe "when result is deleted" do
      # player.win_count should decrease by 1
      before do
        result_one.destroy
        result_one.player.reload
      end
      it { result_one.player.win_count.should == (@orig_win_count - 1) }
    end
  end
end