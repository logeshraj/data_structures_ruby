def ways_denoms(amount, denoms, index)
  return 1 if index >= denoms.length
  ways = 0
  current_denom = denoms[index]
  i = 0 
  while(i * current_denom < amount)
    remaining_amount = amount - current_denom
    ways += ways_denoms(remaining_amount, denoms, index+1)
    i += 1
  end
  ways
end


denoms = [25, 10, 5, 1]
start_time = Time.now
puts ways_denoms(500, denoms, 0)
puts "Total Time :: #{Time.now-start_time}"


def ways_denoms_dp(amount, denoms, index, memo)
  return memo[amount][index] unless memo[amount][index].nil?
  return 1 if index >= denoms.length
  ways = 0
  current_denom = denoms[index]
  i = 0 
  while(i * current_denom < amount)
    remaining_amount = amount - current_denom
    ways += ways_denoms_dp(remaining_amount, denoms, index+1, memo)
    i += 1
  end
  memo[amount][index] = ways
  ways
end


total_amount = 500
denoms = [25, 10, 5, 1]
memo = Array.new(total_amount+1, Array.new(denoms.length))
start_time_dp = Time.now
puts ways_denoms_dp(total_amount, denoms, 0, memo)
puts "Total time dp :: #{Time.now - start_time_dp}"