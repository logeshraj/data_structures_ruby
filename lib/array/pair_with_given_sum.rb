def pair_with_given_sum(array, sum)
  sum_map = {}
  array.each do |ele|
    sum_map[ele] = (sum_map[ele] || 0 )+ 1
  end

  twice_count = 0
  array.each do |ele|
    twice_count += 1 if sum_map[sum-ele]
  end
  twice_count/2
end

puts pair_with_given_sum([1,5,7,-1,3,3,3,0], 6)