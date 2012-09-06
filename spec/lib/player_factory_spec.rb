require File.dirname(__FILE__)+'/../spec_helper'
require 'player_factory'
require 'tic_tac_toe'

describe PlayerFactory do

  it "creates a no move player" do
    player = PlayerFactory.no_move_player("1")
    player.should be_kind_of(TicTacToe::Player::Human)
    player.get_move("not used").should be_nil
    player.letter.should eq("o")
  end

  it "creates computer players" do
    player = PlayerFactory.computer_player("1")
    player.should be_kind_of(TicTacToe::Player::Computer)
    player.letter.should eq("o")
  end

  it "creates a no move player when value is Human" do
    player = PlayerFactory.no_move_or_computer_player("2", "Human")
    player.should be_kind_of(TicTacToe::Player::Human)
    player.get_move("not used").should be_nil
    player.letter.should eq("x")
  end

  it "creates a computer player when value is Computer" do
    player = PlayerFactory.no_move_or_computer_player("2", "Computer")
    player.should be_kind_of(TicTacToe::Player::Computer)
    player.letter.should eq("x")
  end

end

