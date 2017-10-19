# There's an existing ruby method for this!!!
def shuffle arr
  arr.sort_by{rand}
end

# ...and an expanded version
def expanded_shuffle arr
  shuf = []
  
  while arr.length > 0
    # Randomly pick one element of the array
    rand_index = rand(arr.length)
    
    # Now go through each item in the array,
    # putting them all into the new_arry except for the
    # randomly chosen one, which goes into shuf.
    
    curr_index = 0
    new_arr = []
    
    arr.each do |item|
      if curr_index == rand_index
        shuf.push item
      else
        new_arr.push item
      end
      curr_index = curr_index + 1
    end
    
    # Replace the original array with the new, smaller array.
    arr = new_arr
  end
  
  shuf
end

puts(shuffle([1,2,3,4,5,6,7,8,9]))