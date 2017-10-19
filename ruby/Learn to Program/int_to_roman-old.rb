# Old Roman Numerals Converter
# Chap 9, Exercise 2

def num_to_old_roman_numeral num
  
  orig_num = num
  
  # Clear values for all characters before starting
  m = 0
  d = 0
  c = 0
  l = 0
  x = 0
  v = 0
  i = 0
  
  # Get 1000s
  if num/1000 >= 1
    m = num/1000
    num = num%1000
  end
  
  # Get 500s
  if num/500 >= 1
    d = num/500
    num = num%500
  end
  
  # Get 100s
  if num/100 >= 1
    c = num/100
    num = num%100
  end
  
  # Get 50s
  if num/50 >= 1
    l = num/50
    num = num%50
  end
  
  # Get 10s
  if num/10 >= 1
    x = num/10
    num = num%10
  end
  
  # Get 5s
  if num/5 >= 5
    v = num/5
    num = num%5
  end
  
  # Get 1s
  if num >= 1
    i = num
  end
  
  roman_numeral = 'M'*m + 'D'*d + 'C'*c + 'L'*l + 'X'*x + 'V'*v + 'I'*i
  
  puts orig_num.to_s + ' in old roman numerals is ' + roman_numeral
end

while true
  puts "Please type a number between 1 and 3000."
  my_num = gets.to_i

  if (my_num <= 0 || my_num > 3000)
    puts 'I said between 1 and 3000.'
  else
    num_to_old_roman_numeral my_num
    break 
  end
end

