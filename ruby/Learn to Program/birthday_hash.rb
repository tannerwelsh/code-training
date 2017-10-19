birthdays = Hash.new

birthdays['Christopher Alexander'] = 'Oct 04, 1936'
birthdays['Christopher Lambert']   = 'Mar 29, 1957'
birthdays['Christopher Lee']       = 'May 27, 1922'
birthdays['Christopher Lloyd']     = 'Oct 22, 1938'
birthdays['Christopher Pine']      = 'Aug 03, 1976'
birthdays['Christopher Plummer']   = 'Dec 13, 1927'
birthdays['Christopher Walken']    = 'Mar 31, 1943'
birthdays['The King of Spain']     = 'Jan 05, 1938'

puts 'Enter a name:'
input = gets.chomp

while true 
  if input == ''
    break
  elsif birthdays.include?(input)
    puts birthdays[input]
    break
  else
    puts 'Please try again, and make it a Christopher.'
  end
end

