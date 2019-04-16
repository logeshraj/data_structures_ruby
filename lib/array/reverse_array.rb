def reverse_array(array)
  puts "before reversing :: #{array}"
  for i in 0..((array.length-1)/2)
    temp = array[i]
    array[i] = array[(array.length-1)-i]
    array[(array.length-1)-i] = temp
  end
  puts "after reversing :: #{array}"
end

# reverse_array([1,2,3,4,5,6,7])

reverse_array([1,2,3,4,5,6,7,8])