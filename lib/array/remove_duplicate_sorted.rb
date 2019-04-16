def remove_duplicates(nums)
  i = 0
  j = 0
  while(j< nums.length)
    if nums[i] != nums[j]
      nums[i+1] = nums[j]
      i = i+1
    end
    j+=1
  end
  i+1
end

print remove_duplicates([0,0,1,1,1,2,2,3,3,4])