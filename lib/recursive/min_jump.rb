INT_MAX = 99999999999999999999999999999

def min_jump(arr, left)
  return @min_table[left] if @min_table[left]
  return 0 if left == arr.length - 1
  return INT_MAX if arr[left] == 0
  min = INT_MAX
  i = left + 1
  while(i <= arr.length-1 && i <= left + arr[left])
    jumps = min_jump(arr, i) + 1
    min = jumps if jumps < min
    i +=1
  end
  @min_table[left] = min
  min
end

def jump(nums)
  @min_table = Array.new(nums.length) { nil }
  min_jump(nums, 0)
end

# p jump([2,3,1,1,4])
p jump [5,6,4,4,6,9,4,4,7,4,4,8,2,6,8,1,5,9,6,5,2,7,9,7,9,6,9,4,1,6,8,8,4,4,2,0,3,8,5]