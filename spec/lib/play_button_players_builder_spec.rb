require File.dirname(__FILE__)+'/../spec_helper'
require 'player_factory'
require 'play_button_players_builder'
require 'tic_tac_toe'

describe PlayButtonPlayersBuilder do
  it "sets both players to no moves when player 1 is human" do
    players = PlayButtonPlayersBuilder.new("Human", "not used")
    players.player_1.get_move("not used").should be_nil
    players.player_2.get_move("not used").should be_nil
  end

  it "sets the proper players when both are computer" do
    players = PlayButtonPlayersBuilder.new("Computer", "Computer")
    players.player_1.should be_kind_of(TicTacToe::Player::Computer)
    players.player_2.should be_kind_of(TicTacToe::Player::Computer)
  end

  it "sets player 2 to no move player when player 2 is Human and player 1 is Computer" do
    players = PlayButtonPlayersBuilder.new("Computer", "Human")
    players.player_2.get_move("not used").should be_nil
  end
end
