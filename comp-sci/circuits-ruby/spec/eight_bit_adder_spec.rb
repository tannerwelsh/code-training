require 'spec_helper'

describe "EightBitAdder" do
  it "correctly sums two eight bit numbers" do
    EightBitAdder(1.to_bits, 1.to_bits).should eq 2.to_bits(9)
  end

  it "returns a nine bit number" do
    EightBitAdder(1.to_bits, 1.to_bits).length.should eq 9
  end

  it "corretly returns the sum of 255 and 1" do
    EightBitAdder(1.to_bits, 255.to_bits).should eq 256.to_bits
  end

  it "returns an eight bit number and a one bit carry_out" do
    EightBitAdder(1.to_bits, 1.to_bits)[1..8].should eq 2.to_bits
    EightBitAdder(1.to_bits, 1.to_bits)[0].should eq 0
  end
end
