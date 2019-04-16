def max_subarray_brute_force(array)
  max = 0
  max_array = []
  (array.length-1).times do |index|
    j = index
    current_max = array[j]
    current_max_array = []
    while(j<array.length-1)
      current_max += array[j]
      current_max_array.push array[j]
      if current_max > max
        max = current_max 
        max_array = current_max_array
      end
      j+=1
    end
  end
  return max, max_array
end


max, max_array = max_subarray_brute_force([1,2,-1,-3,4,-6,1,5,-2])
puts max
print max_array
puts ''


def max_subarray_kadanes(array)
  max = current_max = array[0]
  current_max_array = max_array = []
  current_max_array.push array[0]
  max_array = current_max_array
  array[1..array.length-1].each do |element|
    temp = current_max+element
    if  temp > element && temp > current_max
      current_max = temp
      current_max_array.push element
    else
      current_max = element
      current_max_array = [element] 
    end
    if current_max > max
      max = current_max
      max_array = current_max_array
    end 
  end
  return max, max_array
end

max, max_array = max_subarray_kadanes([1,2,-1,-3,4,-6,6,5,-2,-3,4,5])
puts max
print max_array
puts ''

def min_subarray_kadanes(array)
  min = current_min = array[0]
  current_min_array = min_array = []
  current_min_array.push array[0]
  min_array = current_min_array
  array[1..array.length-1].each do |element|
    temp = current_min+element
    if  temp < element && temp < current_min
      current_min = temp
      current_min_array.push element
    else
      current_min = element
      current_min_array = [element] 
    end
    if current_min < min
      min = current_min
      min_array = current_min_array
    end 
  end
  return min, min_array
end

min, min_array = min_subarray_kadanes([1,2,-1,-3,4,-6,-2,6,5,-2,-3,4,5])
puts min
print min_array
puts ''
