def trap(height)
  return 0 if height.nil? || height.empty?
  capacity = 0
  length = height.length
  left_max = []
  right_max = []
  i = 1
  left_max[0] = height[0]
  while(i < length)
    left_max[i] = [height[i], left_max[i-1]].max
    i+=1
  end
  i = length - 2
  right_max[length-1] = height[length-1]
  while(i >=0)
    right_max[i] = [height[i], right_max[i+1]].max
    i-=1
  end
  i = 0
  while(i < length)
    capacity += [left_max[i], right_max[i]].min - height[i]
    i+=1
  end
  capacity
end


puts trap([3,1,3])