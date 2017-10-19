puts "Please type some words:"

words = []

while true
  input = gets.chomp.downcase
  words.push input
  if input == ''
    break
  end
end

words = words.sort

puts words