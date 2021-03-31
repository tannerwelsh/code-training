# Normal Roman Numerals Converter
# Chap 9, Exercise 3

def num_to_roman_numeral num
  
  orig_num = num
  
  # Clear values for all characters before starting
  m = ''
  d = ''
  c = ''
  l = ''
  x = ''
  v = ''
  i = ''
  
  # Get 1000s
  if num/1000 >= 1
    m = 'M'*(num/1000)
    num = num%1000
  end
  
  # Get 500s
  if num/500 >= 1
    if num/100 == 9
      d = ''
      c = 'CM'
      num = num%100
    else
      d = 'D'*(num/500)
      num = num%500
    end
  end
  
  # Get 100s
  if num/100 >= 1
    c = 'C'*(num/100)
    num = num%100
  end
  
  # Get 50s
  if num/50 >= 1
    if num/10 == 9
      l = ''
      x = 'XC'
      num = num%10
    else
      l = 'L'*(num/50)
      num = num%50
    end
  end
  
  # Get 10s
  if num/10 >= 1
    if num/10 == 4
      x = 'XL'
    else
      x = 'X'*(num/10)
    end
    num = num%10
  end
  
  # Get 5s
  if num/5 >= 1
    if num == 9
      v = ''
      i = 'IX'
      num = 0
    else
      v = 'V'*(num/5)
      num = num%5
    end
  end
  
  # Get 1s
  if num >= 1
    if num == 4
      i = 'IV'
      num = 0
    else
      i = 'I'*num
    end
  end
  
  roman_numeral = m + d + c + l + x + v + i
  
  puts orig_num.to_s + ' in old roman numerals is ' + roman_numeral
end

while true
  puts "Please type a number between 1 and 3000."
  puts "To exit type 'end'."
  my_num = gets.chomp

  if my_num == 'end'
    break
  elsif (my_num.to_i <= 0 || my_num.to_i > 3000)
    puts 'I said between 1 and 3000.'
  else
    num_to_old_roman_numeral my_num.to_i
  end
end

