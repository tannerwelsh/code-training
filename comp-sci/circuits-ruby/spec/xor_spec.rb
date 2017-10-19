require 'spec_helper'

describe "XOR" do
  it "has two inputs" do
    method(:XOR).arity.should eq 2
  end

  context "when both inputs are 0" do
    it "returns 0" do
      XOR(0, 0).should eq 0
    end
  end

  context "when both inputs are 1" do
    it "returns 0" do
      XOR(1, 1).should eq 0
    end
  end

  context "when inputs are 1 and 0" do
    it "returns 1" do
      XOR(0, 1).should eq 1
      XOR(1, 0).should eq 1
    end
  end
end
