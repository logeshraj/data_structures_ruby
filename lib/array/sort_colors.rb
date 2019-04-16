# def sort_colors(nums)
#   low = 0 
#   hi = nums.length-1
#   mid = 0
#   while(low <= mid || mid <= hi)
#     case nums[mid]
#     when 0
#       nums[low], nums[mid] = nums[mid], nums[low]
#       low += 1
#       mid += 1
#       while(nums[low] == 0)
#         low += 1
#       end
#     when 1
#       mid += 1
#     when 2
#       nums[mid], nums[hi] = nums[hi], nums[mid]
#       mid += 1
#       hi -= 1
#       while(nums[hi] == 2)
#         hi -= 1
#       end
#     end
#     puts "low :: #{low}"
#     puts "mid :: #{mid}"
#     puts "hi :: #{hi}"
#     print nums
#     puts ""
#   end
#   nums
# end

# print sort_colors([])
# print sort_colors([0])
# print sort_colors([1])
# print sort_colors([2])
# print sort_colors([0,2])
# print sort_colors([0,1,2])
# print sort_colors([2,1,0])
# print sort_colors([2,0,1])
# print sort_colors([2,0,0])
# print sort_colors([2,0,2,1,1,0])

def sort_colors(nums)
  nums_hash = {0 => 0, 1 => 0, 2 => 0}
  nums.each do |num|
    nums_hash[num] += 1
  end
  i = 0 
  nums_hash.keys.each do |key|
    nums_hash[key].times do
      nums[i] = key
      i += 1
    end
  end
end
print sort_colors([2,2,2,2,2,0,1,2,1,2,0,0,0,1,1])