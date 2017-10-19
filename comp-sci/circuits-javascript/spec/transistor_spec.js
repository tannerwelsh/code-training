var transistor = require('../js/circuits').transistor
, relay = transistor.relay
, inverter = transistor.inverter;

describe("relay()", function() {
  describe("when switch input is 1", function() {
    it("returns 1", function() {
      expect( relay(1) ).toBe(1);
    });
  });

  describe("when switch input is 0", function() {
    it("returns 0", function() {
      expect( relay(0) ).toBe(0);
    });
  });

  describe("when constant input is 0", function() {
    it("always returns 0", function() {
      expect( relay(1, 0) ).toBe(0);
      expect( relay(0, 0) ).toBe(0);
    });
  });
});

describe("inverter()", function() {
  describe("when switch input is 1", function() {
    it("returns 0", function() {
      expect( inverter(1) ).toBe(0);
    });
  });

  describe("when switch input is 0", function() {
    it("returns 1", function() {
      expect( inverter(0) ).toBe(1);
    });
  });

  describe("when constant input is 0", function() {
    it("always returns 0", function() {
      expect( inverter(1, 0) ).toBe(0);
      expect( inverter(0, 0) ).toBe(0);
    });
  });
});
