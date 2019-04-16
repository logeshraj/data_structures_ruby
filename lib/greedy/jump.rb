def can_jump(nums)
  last_good = nums.length-1
  i = nums.length-2
  while(i >= 0)
    if i + nums[i] >= last_good
      last_good = i
    end
    i -= 1
  end
  last_good == 0
end