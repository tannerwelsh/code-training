var gate = require('./gate')
, and = gate.and
, xor = gate.xor;

function halfAdder(a, b, callback) {
  var output = [ and(a, b), xor(a, b) ];

  if (typeof callback === 'function')
    return callback(output);

  return output;
}

// Adders perform binary sum operations
module.exports = {
  halfAdder: halfAdder
}
