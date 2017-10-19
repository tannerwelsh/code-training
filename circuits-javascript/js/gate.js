var transistor = require('./transistor')
, relay = transistor.relay
, inverter = transistor.inverter;

function and(a, b) {
  return relay( b, relay(a, 1) );
}

function or(a, b) {
  if (relay(a) === 1)
    return 1;

  return relay(b);
}

function nand(a, b) {
  if (inverter(a) === 1)
    return 1;

  return inverter(b);
}

function xor(a, b) {
  return and( or(a, b), nand(a, b) );
}

// Gates perform binary logic on inputs
module.exports = {
  and: and
, or: or
, nand: nand
, xor: xor
}
