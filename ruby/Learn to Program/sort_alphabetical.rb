# Chapter 10, Exercise 2
# This is Chris Pine's code to solve the sort method

words = ['doozie', 'frinkle', 'blasphemy', 'hardy_times', 'wowzer']

def sort arr
  rec_sort arr, []
end

def rec_sort unsorted, sorted
  if unsorted.length <= 0
    return sorted
  end
  
  # So if we got here, then that means there is still work to do
  # Remove the last element from the unsorted array
  smallest = unsorted.pop
  # Create or blank out an array for the leftovers
  still_unsorted = []
  
  # Do this loop for each of the remaining elements in "unsorted"
  unsorted.each do |tested_object|
    # Check if the current object is less than the "smallest" one
    if tested_object < smallest
      # If it is, then move the "smallest" to the still_unsorted array to be tested in the recursion
      still_unsorted.push smallest
      # And then set the current object to the value "smallest", since it has passed the test
      smallest = tested_object
    else
      # If the current element is larger than the "smallest", then move it to the still_unsorted array
      still_unsorted.push tested_object
    end
  end
  
  # Now "smallest" really does point to the smallest element that "unsorted" contained, and all the rest of it is in "still_unsorted"
  sorted.push smallest
  
  # Recursion - do the test over again
  rec_sort still_unsorted, sorted
end

puts sort words