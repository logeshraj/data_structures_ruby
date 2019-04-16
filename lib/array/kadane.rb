def max_subarray(array)
   max = current_max = array[0]
  return nil if array.nil?
  return max if array.length == 1
  index = 1
  length = array.length
  while(index < length)
    binding.irb
    current_max = 0 if current_max < 0
    current_max += array[index]
    max = current_max if current_max > max
    max = array[index] if array[index] > current_max && array[index] > max
    index += 1
  end
  return max
end

# puts max_subarray([-2, -3, 4, -1, -2, 1, 5, -3])
# puts max_subarray([-1,1,2,1])

puts max_subarray [-2,1,-3,4,-1,2,1,-5,4]