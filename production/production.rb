require 'rubygems'
require "bundler/setup"

on_production_created do
  require 'tic_tac_toe'
end
