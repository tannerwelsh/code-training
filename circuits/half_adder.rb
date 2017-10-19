# Adds two bits and returns the sum and carry over
def HalfAdder a, b
  if block_given?
    yield [AND(a, b), XOR(a, b)]
  else
    [AND(a, b), XOR(a, b)]
  end
end
