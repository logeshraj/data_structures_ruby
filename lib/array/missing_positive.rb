def first_missing_positive(nums)
  return 1 if nums.nil? || nums.empty?
  nums, offset = segregate_negatives nums
  missing_positive nums[offset..nums.length-1]
end

def segregate_negatives(nums)
  i = 0 
  j = 0
  while(i < nums.length)
    if nums[i] <= 0
      unless i == j
        temp = nums[i]
        nums[i] = nums[j]
        nums[j] = temp
      end
      j+=1
    end
    i += 1
  end
  return nums, j
end

def missing_positive(nums)
  index = 0
  while(index < nums.length)
    nums[nums[index].abs-1] = -(nums[nums[index].abs-1]) if nums[index].abs <= nums.length && nums[nums[index].abs-1] > 0
    index+=1
  end
  index = 0
  while(index < nums.length)
    return index+1 if nums[index] > 0
    index+=1
  end
  index+1
end


puts first_missing_positive([-1,2,3,1,4,6,-1])
puts first_missing_positive([])
puts first_missing_positive([0])
puts first_missing_positive([1])
puts first_missing_positive([2])
puts first_missing_positive([0,1,9,-1,8,2])
