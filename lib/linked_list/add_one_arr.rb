def plusOne(array)
  last_index = array.length - 1
  index = last_index
  remainder = 1
  while (remainder != 0 && index >= 0)
    value = array[index]
    array[index] = (value + remainder) % 10 
    remainder = (value + remainder) / 10
    if index == 0 && value + remainder == 10
      array.unshift 1
    end
    index -= 1 
  end
  while(array[0] == 0)
    array.delete_at 0
  end
  array
end

plusOne([ 0, 3, 7, 6, 4, 0, 5, 5, 5 ])
