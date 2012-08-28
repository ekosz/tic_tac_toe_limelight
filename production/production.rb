require 'rubygems'
require "bundler/setup"
require 'json'

on_production_created do
  require 'tic_tac_toe'
  require File.dirname(__FILE__) + '/lib/grid_util'
end

def player_1=(player); @player_1 = player end
def player_2=(player); @player_2 = player end

def player_1; @player_1 end
def player_2; @player_2 end

def game(grid)
  TicTacToe::Game.new(grid, @player_1, @player_2)
end
