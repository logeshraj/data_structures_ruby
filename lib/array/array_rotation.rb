def rotate_array(array, delimit)
  k = array.length
  puts k
  d = delimit
  puts d
  n = k - d
  puts n
  new_array = Array.new(k)
  puts new_array
  i = n
  while(i < k)
    new_array.push array[i]
    i+=1
  end
  puts new_array
  i = 0
  while(i < n)
    new_array.push array[i]
    i+=1
  end
  new_array
end

# rot = rotate_array([1,2,3,4,5,6], 2)
# puts rot


def rotate_array1(array, delimit)
  k = array.length
  i = 0
  while(i < delimit)
    temp = array[0]
    index = 0
    while(index < k-1)
      array[index] = array[index+1]
      index += 1
    end
    array[k-1] = temp
    i+=1
  end
  array
end

rot = rotate_array1([1,2,3,4,5,6], 2)
puts rot


def rotate_array2(array, delimit)
  i = 0 
  while(i < delimit)
    
  end

  array
end

rot = rotate_array2([1,2,3,4,5,6,7,8,9,10,11], 3)
puts rot