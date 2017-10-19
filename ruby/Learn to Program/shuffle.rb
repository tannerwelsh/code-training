# Shuffle word array
# Chap 10, Exercise 1

words = ['bobble', 'happy', 'Dickie', 'Bunny', 'zooloft']

def shuffle some_array
  # This "wraps" rec_shuffle
  rec_shuffle some_array, []
end

def rec_shuffle unshuffled, shuffled
  shf_lnth = shuffled.length
  unshf_lnth = unshuffled.length
  
  # Set the code to run in the first iteration 
  # (i.e. make a shuffled array of equal size to the unshuffled one, and fill it with blank values)
  if shf_lnth == 0
    unshf_lnth.times do
      shuffled.push '0'
    end
    shf_lnth = shuffled.length
  # Then the code to terminate the recursion - 
  # if the unshuffled array is empty, it means everything has been shuffled
  elsif unshf_lnth == 0
    return shuffled
  end
  
  # Set some local variables
  num = rand(shf_lnth)
  
  # Check if the randomized object in the shuffled array is empty,
  # and if it is, then move the last item in the unshuffled array to its position
  if shuffled[num] == '0'
    to_shuffle = unshuffled.pop
    shuffled[num] = to_shuffle
  end
  
  rec_shuffle unshuffled, shuffled
end

puts shuffle words