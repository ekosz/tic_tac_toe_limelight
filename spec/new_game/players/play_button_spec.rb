require File.dirname(__FILE__)+'/../../spec_helper'

describe "Play Button" do
  uses_limelight :scene => "new_game", :with_players => "play_button"

  it "has the text of play" do
    play_button.text.should == "play"
  end

  it "plays the first round if player 1 is a computer" do
    scene.find("player_1").drop_down.value = "Computer"
    scene.find("player_2").drop_down.value = "Human"

    mouse.push play_button

    count_letters(current_scene).should == 1
  end

  it "does not play the first round when player 2 is a computer" do
    scene.find("player_1").drop_down.value = "Human"
    scene.find("player_2").drop_down.value = "Computer"

    mouse.push play_button

    count_letters(current_scene).should == 0
  end

  it "sets the headline if the game is over" do
    scene.find("player_1").drop_down.value = "Computer"
    scene.find("player_2").drop_down.value = "Computer"

    mouse.push play_button

    current_scene.find("headline").text.should == "Cats Game!"
  end

  def current_scene
    production.theater.default_stage.scene
  end
end
