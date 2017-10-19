require 'spec_helper'

describe "OR" do
  it "has two inputs" do
    method(:OR).arity.should eq 2
  end

  context "when both inputs are 0" do
    it "returns 0" do
      OR(0, 0).should eq 0
    end
  end

  context "when both inputs are 1" do
    it "returns 1" do
      OR(1, 1).should eq 1
    end
  end

  context "when either input is 1" do
    it "returns 1" do
      OR(0, 1).should eq 1
      OR(1, 0).should eq 1
    end
  end
end
