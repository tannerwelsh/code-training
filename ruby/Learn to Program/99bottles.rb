bottles = 100

while bottles > 0
  if bottles == 1
    puts "One more bottle of beer on the wall, one more bottle of beer,"
    puts "take it down, pass it around,"
    puts "no more bottles of beer on the wall"
    break
  else
    puts "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer,"
    puts "Take one down, pass it around,"
    bottles = bottles - 1
    puts "#{bottles} bottles of beer on the wall."
  end
end