require 'spec_helper'

describe Player do

  before { @player = Player.new(name: "Example User") }

  subject { @player }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @player.name = " " }
    it { should_not be_valid }
  end
  
end