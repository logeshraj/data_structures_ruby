def can_jump(nums)
	return true if nums.nil? || nums.empty?
	memo = Array.new(nums.length) { -1 }
	memo[nums.length-1] = 1
	i = nums.length-2
	while(i >= 0)
		furthest = [i + nums[i], nums.length-1].min
		j = i + 1
		while(j <= furthest)
			if memo[j] == 1
				memo[i] = 1 
				break
			end
			j+=1
		end
		i-=1
	end
	memo[0] == 1
end


p can_jump([3,2,1,0,1])