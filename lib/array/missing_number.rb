def missing_number(array)
  repeated = nil
  [*0..array.length-1].each do |ind|
    val = array[ind]
    if array[val.abs-1] > 0
      array[val.abs-1] = -(array[val.abs-1])
    else
      repeated = val.abs
    end
  end
  missing = nil
  array.each do |ele|
    if ele > 0
      missing = array.index(ele)+1
      break
    end
  end
  [repeated,missing]
end

puts missing_number([ 2, 3, 3 ])