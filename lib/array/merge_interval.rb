def merge_interval(array)
  return if array.nil? || array.empty?
  array = array.sort{ |a,b| a[0] <=> b[0] }
  length = array.length
  stack = []
  i = 0
  while(i < length)
    top = stack.last
    current = array[i]
    if top.nil? ||  top[1] + 1 < current[0]
      stack << current
    # elsif top[1] < current[1] 
    else
      top[1] = current[1]
    end
    i += 1
  end
  stack
end


st = merge_interval( [[1, 2], [3, 4], [5, 7]] )
p st