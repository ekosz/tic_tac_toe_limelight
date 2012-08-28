$: << File.expand_path(File.dirname(__FILE__) + "/../production")

require 'rubygems'
require "bundler/setup"
require 'rspec'
require 'limelight/specs/spec_helper'

$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../production")

include Limelight::Specs::SpecHelper

def count_letters(scene)
  letters = 0
  scene.find_by_name("cell").each do |cell|
    letters += 1 unless cell.text.to_s == ""
  end
  letters
end
