
def subsets(nums)
  subsets = []
  result = []
  result << []
  subsets_util(nums, result, subsets, 0)
  result
end

def subsets_util(nums, result, subset, index)
  for i in index .. nums.length-1
    subset << nums[i].dup
    result << subset.dup
    subsets_util(nums, result, subset, i + 1)
    subset.pop
  end
end


print subsets([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30])