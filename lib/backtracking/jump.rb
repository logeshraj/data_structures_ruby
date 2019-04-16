def can_jump(nums)
  return true if nums.nil? || nums.empty?
  jump_possible?(nums, 0) 
end

def jump_possible?(nums, position)
  return true if position == nums.length - 1
  furthest_jump = [position + nums[position], nums.length - 1].min
  for i in (position+1)..furthest_jump
    return true if jump_possible?(nums, i)
  end
  return false
end