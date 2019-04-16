def longest_consecutive(nums)
  nums_hash = {}
  nums.each do |num|
    nums_hash.merge! Hash[num, 1]
  end
  longest_streak = 0
  nums_hash.each do |num, val|
    byebug
    if nums_hash[num - 1]
      current_num = num
      current_streak = 1
      while(nums_hash[current_num + 1])
        byebug
        current_num += 1
        current_streak += 1
      end
      longest_streak = [current_streak, longest_streak].max
    end
  end
  longest_streak
end


p longest_consecutive([1,5,3,2,4,8])