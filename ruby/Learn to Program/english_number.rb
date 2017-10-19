# Chapter 10, Section 4

def english_number number
  # We accept numbers over 0
  if number < 0
    return "Please enter a number greater than zero. \n Enter zero to end program."
  end
  if number == 0
    break
  end
  
  num_string = ''
  
  ones_place = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
  tens_place = ['ten', 'twenty', 'thirty', 'fourty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
  teenagers = ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
  
  # "left" is how much of the number we still have to write out
  # "write" is the part we are writing out right now
  left = number
  
  write = left/1000000        # How many millions?
  left = left - write*1000000 # Subtract them off
  
  if write > 0
    millions = english_number write
    num_string = num_string + millions + ' million'
    if left > 0
      num_string = num_string + ' '
    end
  end
  
  write = left/1000         # How many thousands?
  left = left - write*1000  # Subtract them off
  
  if write > 0
    thousands = english_number write
    num_string = num_string + thousands + ' thousand'
    if left > 0
      num_string = num_string + ' '
    end
  end
  
  write = left/100        # How many hundreds left?
  left = left - write*100 # Subtract off those hundreds
  
  if write > 0
    # Now here's the recursion
    hundreds = english_number write
    num_string = num_string + hundreds + ' hundred'
    if left > 0
      # So we don't write 'two hundredfifty-one'...
      num_string = num_string + ' '
    end
  end
  
  write = left/10         # How many tens left?
  left = left - write*10  # Subtract off those tens
  
  if write > 0
    if ((write == 1) and (left > 0))
      num_string = num_string + teenagers[left-1]
      left = 0
    else
      num_string = num_string + tens_place[write-1]
    end
    
    if left > 0
      num_string = num_string + '-'
    end
  end
  
  write = left    # How many ones left to write out?
  left = 0        # Subtract off those ones
  
  if write > 0
    num_string = num_string + ones_place[write-1]
  end
  
  num_string
end

while true
  input = gets.chomp.to_i
  if input == ''
    break
  end
  puts english_number input
end