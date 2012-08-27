$: << File.expand_path(File.dirname(__FILE__) + "/../production")

require 'rubygems'
require "bundler/setup"
require 'rspec'
require 'limelight/specs/spec_helper'

$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../production")

include Limelight::Specs::SpecHelper
