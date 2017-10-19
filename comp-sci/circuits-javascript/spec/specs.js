describe("EightBitAdder", function() {
  it("correctly sums two eight bit numbers", function() {
    expect( EightBitAdder(1.to_bits, 1.to_bits) ).toBe( 2.to_bits(9) );
  });

  it("returns a nine bit number", function() {
    expect( EightBitAdder(1.to_bits, 1.to_bits).length ).toBe( 9 );
  });

  it("corretly returns the sum of 255 and 1", function() {
    expect( EightBitAdder(1.to_bits, 255.to_bits) ).toBe( 256.to_bits );
  });

  it("returns an eight bit number and a one bit carry_out", function() {
    expect( EightBitAdder(1.to_bits, 1.to_bits)[1..8] ).toBe( 2.to_bits );
    expect( EightBitAdder(1.to_bits, 1.to_bits)[0] ).toBe( 0 );
  });
});

describe("FullAdder", function() {

  describe("when carry in bit is 0", function() {
    let(:carry_in) { 0 }

    describe("and both inputs are 0", function() {
      it("returns a sum of 0 and carry over of 0", function() {
        expect( FullAdder(0, 0, carry_in) ).toBe(([0, 0]) );
      });
    });

    describe("and both inputs are 1", function() {
      it("returns a sum of 0 and carry over of 1", function() {
        expect( FullAdder(1, 1, carry_in) ).toBe(([1, 0]) );
      });
    });

    describe("and inputs are 1 and 0", function() {
      it("returns a sum of 1 and carry over of 0", function() {
        expect( FullAdder(1, 0, carry_in) ).toBe(([0, 1]) );
        expect( FullAdder(0, 1, carry_in) ).toBe(([0, 1]) );
      });
    });
  });

  describe("when carry in bit is 1", function() {
    let(:carry_in) { 1 }

    describe("and both inputs are 0", function() {
      it("returns a sum of 1 and carry over of 0", function() {
        expect( FullAdder(0, 0, carry_in) ).toBe(([0, 1]) );
      });
    });

    describe("and both inputs are 1", function() {
      it("returns a sum of 1 and carry over of 1", function() {
        expect( FullAdder(1, 1, carry_in) ).toBe(([1, 1]) );
      });
    });

    describe("and inputs are 1 and 0", function() {
      it("returns a sum of 0 and carry over of 1", function() {
        expect( FullAdder(1, 0, carry_in) ).toBe(([1, 0]) );
        expect( FullAdder(0, 1, carry_in) ).toBe(([1, 0]) );
      });
    });
  });
});

