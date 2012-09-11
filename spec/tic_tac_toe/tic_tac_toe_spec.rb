require File.dirname(__FILE__)+'/../spec_helper'

describe "tic_tac_toe Scene" do
  uses_limelight :scene => "tic_tac_toe"

  context "when first started" do
    it "buttons are hidden" do
      scene.find("buttons").style.transparency.should == "100%"
    end
  end
end

