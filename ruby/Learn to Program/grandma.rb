while true
  input = gets.chomp
  year = rand(20) + 1930
  if input != input.upcase
    puts "HUH?! SPEAK UP, SONNY!"
  elsif input == input.upcase && input != 'BYE BYE BYE'
    puts "NO, NOT SINCE #{year}!"
  elsif input == 'BYE'
    puts ""
  elsif input == 'BYE BYE BYE'
    break
  end
end