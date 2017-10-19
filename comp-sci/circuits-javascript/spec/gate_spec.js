var gate = require('../js/circuits').gate
, and = gate.and
, or = gate.or
, nand = gate.nand
, xor = gate.xor;

describe("and()", function() {
  describe("when both inputs are 0", function() {
    it("returns 0", function() {
      expect( and(0, 0) ).toBe(0);
    });
  });

  describe("when both inputs are 1", function() {
    it("returns 1", function() {
      expect( and(1, 1) ).toBe(1);
    });
  });

  describe("when either input is 0", function() {
    it("returns 0", function() {
      expect( and(0, 1) ).toBe(0);
      expect( and(1, 0) ).toBe(0);
    });
  });
});

describe("or", function() {
  describe("when both inputs are 0", function() {
    it("returns 0", function() {
      expect( or(0, 0) ).toBe( 0 );
    });
  });

  describe("when both inputs are 1", function() {
    it("returns 1", function() {
      expect( or(1, 1) ).toBe( 1 );
    });
  });

  describe("when either input is 1", function() {
    it("returns 1", function() {
      expect( or(0, 1) ).toBe( 1 );
      expect( or(1, 0) ).toBe( 1 );
    });
  });
});

describe("nand", function() {
  describe("when both inputs are 0", function() {
    it("returns 1", function() {
      expect( nand(0, 0) ).toBe( 1 );
    });
  });

  describe("when both inputs are 1", function() {
    it("returns 0", function() {
      expect( nand(1, 1) ).toBe( 0 );
    });
  });

  describe("when either input is 0", function() {
    it("returns 1", function() {
      expect( nand(0, 1) ).toBe( 1 );
      expect( nand(1, 0) ).toBe( 1 );
    });
  });
});

describe("xor", function() {
  describe("when both inputs are 0", function() {
    it("returns 0", function() {
      expect( xor(0, 0) ).toBe( 0 );
    });
  });

  describe("when both inputs are 1", function() {
    it("returns 0", function() {
      expect( xor(1, 1) ).toBe( 0 );
    });
  });

  describe("when inputs are 1 and 0", function() {
    it("returns 1", function() {
      expect( xor(0, 1) ).toBe( 1 );
      expect( xor(1, 0) ).toBe( 1 );
    });
  });
});
