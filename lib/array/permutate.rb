def permute(nums)
  start_pos = 0
  end_pos = nums.length - 1
  @permutated = []
  @count = 0
  permutate(nums, start_pos, end_pos)
  @permutated
end

def permutate(nums, start_pos, end_pos)
  return @permutated << nums.dup if (start_pos == end_pos)

  i = start_pos
  while(i < nums.length)
    nums[i], nums[start_pos] = nums[start_pos], nums[i]
    permutate(nums, start_pos+1, end_pos)
    nums[i], nums[start_pos] = nums[start_pos], nums[i]
    i += 1
  end
end

# arr = permute([1,2,3])
# arr = permute([])
# arr = permute([1])
arr = permute([1,2,3])
# arr = permute([1,2,3])
print arr