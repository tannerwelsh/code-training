def Inverter(switch_input, constant_input = 1)
  if switch_input == 1
    0
  elsif switch_input == 0
    constant_input
  end
end
