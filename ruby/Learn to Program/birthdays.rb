my_birthday = Time.local(1986, 7, 28)

one_billion = my_birthday + 1000000000

puts  "My birthday is #{my_birthday}, which means that I will turn one billion seconds old on #{one_billion}. \n" + 
      "When's your birthday?"
puts 
puts 'Year:'
while true
  year = gets.chomp.to_i
  if year > 1901 and year < 2038
    break
  else
    puts 'Please enter a year between 1901 and 2038:'
  end
end
puts
puts 'Month (the number, not the name):'
while true
  month = gets.chomp.to_i
  if month <= 12 and month > 0
    break
  else
    puts 'Please enter the number for your month of birth (2 = February, 8 = October, etc.):'
  end
end
puts
puts 'Day:'
while true
  day = gets.chomp.to_i
  if day > 0 and day <= 31
    break
  else
    puts 'Please enter a day between 1 and 31:'
  end
end

your_birthday = Time.local(year, month, day)
now = Time.new
your_age = (now - your_birthday).to_i

seconds_in_year = (365 * 24 * 60 * 60)
years = your_age/seconds_in_year

puts
puts "Your birthday is #{your_birthday}, which means that you are #{your_age} seconds old, or #{years} years, if you want to be boring."

puts "And now for the spanking..."

years.times do
  puts 'SPANK!'
end