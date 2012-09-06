require File.dirname(__FILE__)+'/../spec_helper'
require 'player_factory'
require 'cell_players_builder'
require 'tic_tac_toe'
require 'ostruct'

describe CellPlayersBuilder do

  it "player 1 should be human" do
    players = CellPlayersBuilder.new("not used", "not used", "not used")

    players.player_1.should be_kind_of(TicTacToe::Player::Human)
  end

  it "sets the proper human" do
    players = CellPlayersBuilder.new("1", "1", "not used")

    players.player_1.letter.should == "o"
    players.player_1.get_move("not used").should == "1"

  end

  context "against a computer" do
    it "sets the proper player 2" do
      players = CellPlayersBuilder.new("not used", "not used", "Computer")

      players.player_2.should be_kind_of(TicTacToe::Player::Computer)
    end
  end

  context "against a human" do
    it "sets the proper player 2" do
      players = CellPlayersBuilder.new("not used", "not used", "Human")

      players.player_2.should be_kind_of(TicTacToe::Player::Human)
    end
  end

end
