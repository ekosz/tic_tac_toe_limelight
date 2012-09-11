require File.dirname(__FILE__)+'/../../spec_helper'

describe "Play Again" do
  uses_limelight :scene => "tic_tac_toe", :with_players => "play_again"

  context "when the game is over" do
    before do
      [1, 2].each { |i| scene.find("cell#{i}").text = "x" }
      mouse.click scene.find("cell3")
    end

    it "goes away after pushed" do
      mouse.push play_again

      scene.find("buttons").style.transparency.should == "100%"
    end

    context "in a computer vs human game" do
      before do
        scene.player_1 = "Computer"
        scene.player_2 = "Human"
      end

      it "plays the first turn" do
        mouse.push play_again

        count(scene).should == 1
      end
    end
  end

  def count(scene)
    scene.find_by_name("cell").select { |cell| cell.text != "" }.count
  end
end
