def NAND a, b
  if Inverter(a) == 1
    1
  elsif Inverter(a) == 0
    Inverter(b)
  end
end
