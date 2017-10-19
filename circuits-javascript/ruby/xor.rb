def XOR a, b
  AND( OR(a, b), NAND(a, b) )
end
