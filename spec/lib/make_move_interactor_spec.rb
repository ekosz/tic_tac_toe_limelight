require File.dirname(__FILE__)+'/../spec_helper'
require 'make_move_interactor'
require 'tic_tac_toe'
require 'ostruct'


describe MakeMoveInteractor do

  it "returns new grid of the game" do
    game = OpenStruct.new(:grid => "Hello")

    results = MakeMoveInteractor.new(game).execute

    results[:grid].should == "Hello"
  end

  it "sets a headline when the game is solved" do
    game = OpenStruct.new(:solved? => true, :cats? => false, :winner => "o")

    results = MakeMoveInteractor.new(game).execute

    results[:headline].should == "o won!"
  end

  it "sets a headline when the game is cats" do
    game = OpenStruct.new(:solved? => false, :cats? => true)

    results = MakeMoveInteractor.new(game).execute

    results[:headline].should == "Cats Game!"
  end

  it "sets game_solved" do
    game = OpenStruct.new(:solved? => true, :cats? => true)

    results = MakeMoveInteractor.new(game).execute

    results[:game_solved].should == true
  end

end
