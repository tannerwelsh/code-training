require 'spec_helper'

describe "FullAdder" do
  it "has three inputs" do
    method(:FullAdder).arity.should eq 3
  end

  context "when carry in bit is 0" do
    let(:carry_in) { 0 }

    context "and both inputs are 0" do
      it "returns a sum of 0 and carry over of 0" do
        FullAdder(0, 0, carry_in).should eq([0, 0])
      end
    end

    context "and both inputs are 1" do
      it "returns a sum of 0 and carry over of 1" do
        FullAdder(1, 1, carry_in).should eq([1, 0])
      end
    end

    context "and inputs are 1 and 0" do
      it "returns a sum of 1 and carry over of 0" do
        FullAdder(1, 0, carry_in).should eq([0, 1])
        FullAdder(0, 1, carry_in).should eq([0, 1])
      end
    end
  end

  context "when carry in bit is 1" do
    let(:carry_in) { 1 }

    context "and both inputs are 0" do
      it "returns a sum of 1 and carry over of 0" do
        FullAdder(0, 0, carry_in).should eq([0, 1])
      end
    end

    context "and both inputs are 1" do
      it "returns a sum of 1 and carry over of 1" do
        FullAdder(1, 1, carry_in).should eq([1, 1])
      end
    end

    context "and inputs are 1 and 0" do
      it "returns a sum of 0 and carry over of 1" do
        FullAdder(1, 0, carry_in).should eq([1, 0])
        FullAdder(0, 1, carry_in).should eq([1, 0])
      end
    end
  end
end
