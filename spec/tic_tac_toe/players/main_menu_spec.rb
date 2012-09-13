require File.dirname(__FILE__)+'/../../spec_helper'

describe "Main Menu" do
  uses_limelight :scene => "tic_tac_toe", :with_players => "main_menu"

  it "changes the scene when pushed" do
    old_scene = scene
    mouse.push main_menu
    current_scene.should_not eq(old_scene)
  end

  def current_scene
    production.theater.default_stage.scene
  end
end
