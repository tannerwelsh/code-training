require 'spec_helper'

describe "AND" do
  it "has two inputs" do
    method(:AND).arity.should eq 2
  end

  context "when both inputs are 0" do
    it "returns 0" do
      AND(0, 0).should eq 0
    end
  end

  context "when both inputs are 1" do
    it "returns 1" do
      AND(1, 1).should eq 1
    end
  end

  context "when either input is 0" do
    it "returns 0" do
      AND(0, 1).should eq 0
      AND(1, 0).should eq 0
    end
  end
end
