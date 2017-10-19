var adder = require('../js/circuits').adder,
, halfAdder = adder.halfAdder;

describe("halfAdder", function() {
  describe("when both inputs are 0", function() {
    it("returns a sum of 0 and carry over of 0", function() {
      expect( halfAdder(0, 0) ).toEqual(([0, 0]) );
    });
  });

  describe("when both inputs are 1", function() {
    it("returns a sum of 0 and carry over of 1", function() {
      expect( halfAdder(1, 1) ).toEqual(([1, 0]) );
    });
  });

  describe("when inputs are 1 and 0", function() {
    it("returns a sum of 1 and carry over of 0", function() {
      expect( halfAdder(1, 0) ).toEqual(([0, 1]) );
      expect( halfAdder(0, 1) ).toEqual(([0, 1]) );
    });
  });
});
