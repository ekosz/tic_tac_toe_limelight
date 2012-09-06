require File.dirname(__FILE__)+'/../../spec_helper'

describe "Cell" do
  uses_limelight :scene => "tic_tac_toe"

  it "can't be clicked until the play button is clicked" do
    cell = scene.find_by_name("cell").first
    mouse.click cell
    [nil, ""].should include(cell.text)
  end

  context "in a player goes first game" do
    it "the first click creates an o" do
      cell = scene.find_by_name("cell").first

      mouse.click cell

      cell.text.should eq("o")
    end

    it "the second click creates an o" do
      mouse.click scene.find_by_name("cell").first
      cell = scene.find_by_name("cell").last

      mouse.click cell

      cell.text.should eq("o")
    end
  end

  context "in a computer goes first game" do
    before do
      player_1 = PlayerFactory.computer_player("1")
      player_2 = PlayerFactory.no_move_player("2")
      helper = GridUtil.new(scene)
      game = TicTacToe::Game.new(helper.current_grid, player_1, player_2)
      game.start
      helper.set_cells_from_game(game.grid)
    end

    it "the first click creates an x" do
      cell = scene.find_by_name("cell").last

      mouse.click cell

      cell.text.should eq("x")
    end

    it "shouldn't take two turns at once" do
      current_count = count_letter("o")
      cell = scene.find_by_name("cell").last

      mouse.click cell

      count_letter("o").should eq(current_count + 1)
    end
  end

  context "in a human vs human game" do
    it "the first click is o" do
      cell = scene.find_by_name("cell").first

      mouse.click cell

      cell.text.should eq("o")
    end

    it "the second click is x" do
      mouse.click scene.find_by_name("cell").first
      cell = scene.find_by_name("cell").last

      mouse.click cell

      cell.text.should eq("x")
    end
  end

  def count_letter(letter)
    scene.find_by_name("cell").select { |cell| 
      cell.text == letter
    }.count
  end
end

