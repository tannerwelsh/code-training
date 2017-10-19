# Chapter 12, Exercise 3
# This is Chris' solution (I forgot to use a hash association)

def roman_to_integer numeral
  # Use a hash to associate the characters with their integers
  digit_vals = {'i' => 1, 'v' => 5, 'x' => 10, 'l' => 50, 'c' => 100, 'd' => 500, 'm' => 1000}
  
  total = 0
  prev  = 0
  
  # Starting from the last character and working backwards, run the following code for each character
  numeral.reverse.each_char do |c_or_C| 
    c = c_or_C.downcase
    val = digit_vals[c]
    
    # Don't accept values that aren't in the hash
    if !val
      puts 'This is not a valid roman numeral'
      return
    end
    
    # If the numeral is a subtraction, it will be less than the previous one, so make its value negative
    if val < prev
      val *= -1
    else
      # If not, then set the prev variable to the current value for the next round
      prev = val
    end
    # And add the val to the total
    total += val
  end
  
  total
end

puts(roman_to_integer 'mcmxcix')
puts(roman_to_integer 'ccclxv')