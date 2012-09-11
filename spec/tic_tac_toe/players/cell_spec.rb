require File.dirname(__FILE__)+'/../../spec_helper'

describe "Cell" do
  uses_limelight :scene => "tic_tac_toe"

  context "in a player goes first game" do
    before do
      scene.player_1 = "Human"
      scene.player_2 = "Computer"
    end

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
      scene.player_1 = "Computer"
      scene.player_2 = "Human"
      player_1 = PlayerFactory.computer_player("1")
      player_2 = PlayerFactory.no_move_player("2")
      scene.make_move(player_1, player_2)
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
    before do
      scene.player_1 = "Human"
      scene.player_2 = "Human"
    end

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

    context "when the game is over" do
      before do
        1.upto(8) { |i| scene.find("cell#{i}").text = "x" }
        mouse.click scene.find("cell9")
      end

      it "shows the play_again and main_menu buttons" do
        scene.find("buttons").style.transparency.should == "0%"
      end
    end

  end

  def count_letter(letter)
    scene.find_by_name("cell").select { |cell| 
      cell.text == letter
    }.count
  end
end

