def climb_stairs(n)
	@dp = {}
	count_ways(n+1)
end

def count_ways(n)
	return n if n <= 1
	return @dp[n] if @dp[n]
	count = count_ways(n-1) + count_ways(n-2)
	@dp[n] = count
	count
end

puts climb_stairs(1)
puts climb_stairs(2)
puts climb_stairs(3)
puts climb_stairs(4)
puts climb_stairs(1000)