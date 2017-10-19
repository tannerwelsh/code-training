require 'spec_helper'

describe "Relay" do
  it "has two inputs, with second defaulting to 1" do
    method(:Relay).arity.should eq -2
  end

  context "when switch input is 1" do
    it "returns 1" do
      Relay(1).should eq 1
    end
  end

  context "when switch input is 0" do
    it "returns 0" do
      Relay(0).should eq 0
    end
  end

  context "when constant input is 0" do
    it "always returns 0" do
      Relay(1, 0).should eq 0
      Relay(0, 0).should eq 0
    end
  end
end
