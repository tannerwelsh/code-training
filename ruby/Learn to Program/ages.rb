hours = 24 * 365

puts 'There are ' + hours.to_s + ' hours in a year'

minutes = 60 * 24 * ((365 * 8) + (366 * 2))
alt_minutes = 60 * 24 * 365 * 10

puts "There are #{minutes} minutes in a decade. Or is it #{alt_minutes}? I'm not sure."

my_age_in_seconds = 24 * 365 * 24 * 60 * 60

puts "I am #{my_age_in_seconds} seconds old."

authors_age_in_seconds = 1025000000 / (365 * 24 * 60 * 60)

puts "The author is #{authors_age_in_seconds} years old."