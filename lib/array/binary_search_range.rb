def search_range(nums, target)
  @start_pos = -1
  @end_pos = -1
  @count = 0
  binary_search_range(nums, 0, nums.length-1, target) 
end

def binary_search_range(nums, left, right, target)
  @count += 1
  puts @count
  mid = (left+right)/2
  nums[mid]
  if left < right
    if nums[mid] == target

      @start_pos = mid if @start_pos ==-1 || mid < @start_pos
      @end_pos = mid if @start_pos == -1 || mid > @end_pos

      binary_search_range(nums, left, mid-1, target)
      binary_search_range(nums, mid+1, right, target)

    elsif target < nums[mid] && target >= nums[left]

      binary_search_range(nums, left, mid-1, target)

    elsif target <= nums[right] && target > nums[mid]

      binary_search_range(nums, mid+1, right, target)

    end

  elsif left == right && nums[left] == target

    @start_pos = left if @start_pos ==-1 || left < @start_pos
    @end_pos = left if @start_pos == -1 || left > @end_pos

  end
    
  [@start_pos, @end_pos]
end

# print search_range([5,7,7,8,8,10], 8)
# puts ""
# print search_range([5,7,7,8,8,10], 5)
# puts ""
# print search_range([5,7,7,8,8,10], 7) # failing
# puts ""
# print search_range([5,7,7,8,8,10], 10)
# puts ""
# print search_range([5,7,7,8,8,10], 11)
# puts ""
# print search_range([], 7)
# puts ""
# print search_range([7], 7)
# puts ""
# print search_range([8], 7)
# puts ""
# print search_range([1,3], 3) # failing
# puts ""
# print search_range([3,3], 3)
# puts ""
# print search_range([2,2,2,2,2,2], 2)
puts ""
print search_range([2,2,2,2,2,2,2,2,2,2,2,2,2,2,2], 2)
