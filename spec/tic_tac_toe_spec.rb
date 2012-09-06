require 'spec_helper'

describe "Tic Tac Toe" do
  uses_limelight :scene => "new_game"

  it "has has a play button" do
    play = scene.find("play_button")
    play.should_not be_nil
  end

  %w(player_1 player_2).each do |player|
    it "has a player chooser" do
      player = scene.find(player)
      player.should_not be_nil
      player.drop_down.value.should == "Human"
      player.drop_down.choices.contains("Human").should == true
      player.drop_down.choices.contains("Computer").should == true
    end
  end

  it "can play a computer vs computer game" do
    scene.find("player_1").drop_down.value = "Computer"
    scene.find("player_2").drop_down.value = "Computer"

    mouse.push scene.find("play_button")

    scene.find_by_name("cell").each do |cell|
      ["x", "o"].should include(cell.text)
    end

    scene.find("headline").text.should == "Cats Game!"
  end
end
