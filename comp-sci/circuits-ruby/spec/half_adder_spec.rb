require 'spec_helper'

describe "HalfAdder" do
  context "when both inputs are 0" do
    it "returns a sum of 0 and carry over of 0" do
      HalfAdder(0, 0).should eq([0, 0])
    end
  end

  context "when both inputs are 1" do
    it "returns a sum of 0 and carry over of 1" do
      HalfAdder(1, 1).should eq([1, 0])
    end
  end

  context "when inputs are 1 and 0" do
    it "returns a sum of 1 and carry over of 0" do
      HalfAdder(1, 0).should eq([0, 1])
      HalfAdder(0, 1).should eq([0, 1])
    end
  end
end
