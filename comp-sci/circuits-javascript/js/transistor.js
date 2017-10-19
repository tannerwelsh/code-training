function relay(switchInput, constantInput) {
  if (constantInput === undefined)
    constantInput = 1;

  if (switchInput === 1)
    return constantInput;

  return switchInput
}

function inverter(switchInput, constantInput) {
  if (constantInput === undefined)
    constantInput = 1;

  if (switchInput === 1)
    return 0;

  return constantInput;
}

// Transistors include relays and inverters
module.exports = {
  relay: relay
, inverter: inverter
}
