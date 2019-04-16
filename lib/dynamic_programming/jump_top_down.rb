def can_jump(nums)
  return true if nums.nil? || nums.empty?
  @memo = Array.new(nums){ -1 }
  @memo[nums.length-1] = 1
  jump_possible?(nums, 0) 
end

def jump_possible?(nums, position)
  return true if @memo[position] == 1
  furthest_jump = [position + nums[position], nums.length - 1].min
  for i in (position+1)..furthest_jump
    if jump_possible?(nums, i)
      return true
      @memo[i] = 1
    end
  end
  @memo[position] = 0
  return false
end