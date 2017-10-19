# Shuffle word array
# Chap 10, Exercise -1

##
# => Failed. Utterly failed.
##


# Tell the story:
# First, I create an array. 
# Then, I define the wrapper method to give the recursive array a place to recur within.
# Third, I define the recursive method. This must do the following things:
#   1. Start with the first element in the array
#   2. Check to see if its downcase is less than all of the other elements' downcase.
#     - If it is less than all the others, then:
#       • Pass it to the sorted array and 
#       • Mark its position in the original array.
#       • Move the element selector one place up and call the recursive method on it
#     - If it is greater than 

words = ['zebra', 'blank']

def sort unsorted_array
  
  # Define the local variables to use in the test
  x = 0
  y = 1
  
  sorted_array = []
  test_array = []
  
  unsorted_length = unsorted_array.length
  
  # Start the loop
  
  while true
    # Set the variables that must change with each iteration
    word_x = unsorted_array[x]  # Base word
    word_y = unsorted_array[y]  # Word to compare
    
    sorted_length = sorted_array.length
    test_length = test_array.length
    
    # Break out of loop as soon as the two arrays are of the same length
    if sorted_length == unsorted_length
      break
    end
    
    # Check to see if all the values have been tested and passed
    if test_length == (unsorted_length - 1)
      # Put the lowest word into the sorted array, and reset both it and the test array
      sorted_array.push word_x
      test_array = []
      unsorted_array[x] = 'PUSHED'
      if x == (unsorted_length - 1)
        x = 0
      else
        x = x + 1
      end
    # Check to see if the base word is less than or equal to the compared word, and that neither are nil or the same spot
    elsif (word_x != 'PUSHED') and (word_y != 'PUSHED') and (x != y) and (word_y != nil) and (word_x != nil) and (word_x < word_y)
      # Put the base word into the test array
      test_array.push word_x
      if y == (unsorted_length - 1)
        y = 0
      else
        y = y + 1
      end
    else
      ### !!!! This is a problem
      if x == (unsorted_length - 1)
        x = 0
      else
        x = x + 1
      end
      if y == (unsorted_length - 1)
        y = 0
      elsif y == x
        y = x + 1
      else
        y = y + 1
      end
    end
  end
  
  puts sorted_array
end

sort words