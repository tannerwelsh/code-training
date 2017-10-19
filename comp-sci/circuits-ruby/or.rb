def OR a, b
  if Relay(a) == 1
    1
  elsif Relay(a) == 0
    Relay(b)
  end
end
