puts 'Give me a start year:'
year1 = gets.chomp.to_i
puts '..and now an end year:'
year2 = gets.chomp.to_i

if year1%4 == 0
  leap_year = year1
else year1%4 != 0
  offset = year1%4
  leap_year = year1 + (4 - offset)
end

puts "The leap years in between are:"

while leap_year <= year2
  if leap_year%100 != 0
    puts leap_year
  end
  leap_year = leap_year + 4
end