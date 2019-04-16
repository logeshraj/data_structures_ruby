def search(nums, target)
  search_target(nums, 0, nums.length-1, target)
end

def search_target(nums, left, right, target)
  return -1 if left > right
  mid = (left+right)/2
  return mid if nums[mid] == target
  if nums[left] <= nums[mid]
    return search_target(nums, left, mid-1, target) if target >= nums[left] && target <= nums[mid]
    return search_target(nums, mid+1, right, target)
  end

  return search_target(nums, mid+1, right, target) if target >= nums[mid] && target <= nums[right]
  return search_target(nums, left, mid-1, target)
end

puts search([1,3], 3)