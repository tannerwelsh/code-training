require 'spec_helper'

describe "Inverter" do
  it "has two inputs, with second defaulting to 1" do
    method(:Inverter).arity.should eq -2
  end

  context "when switch input is 1" do
    it "returns 0" do
      Inverter(1).should eq 0
    end
  end

  context "when switch input is 0" do
    it "returns 1" do
      Inverter(0).should eq 1
    end
  end

  context "when constant input is 0" do
    it "always returns 0" do
      Inverter(1, 0).should eq 0
      Inverter(0, 0).should eq 0
    end
  end
end
