require 'spec_helper'

describe "Tic Tac Toe" do
  uses_limelight :scene => "tic_tac_toe"

  it "has a grid" do
    grid = scene.find("grid")
    grid.should_not be_nil
  end

  it "has has a play button" do
    play = scene.find("play_button")
    play.should_not be_nil
  end

  it "has a player 1 chooser" do
    player = scene.find("player_1")
    player.should_not be_nil
    player.value.should == "Human"
    player.choices.should == ["Computer"]
  end

  it "has a player 2 chooser" do
    player = scene.find("player_2")
    player.should_not be_nil
    player.value.should == "Human"
    player.choices.should == ["Computer"]
  end

  it "can play a computer vs computer game" do
    scene.find("player_1").value = "Computer"
    scene.find("player_2").value = "Computer"

    mouse.push scene.find("play_button")

    scene.find_by_name("cell").each do |cell|
      ["x", "o"].should_include cell.text
    end
    scene.find("headline").text.should == "Cats Game!"
  end
end
