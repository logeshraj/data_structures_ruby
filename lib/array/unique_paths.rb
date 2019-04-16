def unique_paths(m, n)
  @dp = {}
  count_path(m, n)
end

def count_path(m, n)
  return 0 if m == 0 || n ==0
  return 1 if m == 1 || n == 1
  return @dp["#{m}:#{n}"] if @dp["#{m}:#{n}"]
  count = count_path(m-1, n) + count_path(m, n-1) 
  @dp.merge! Hash["#{m}:#{n}", count]
  count
end

# puts unique_paths(3,2)
# puts unique_paths(7,3)
puts unique_paths(23,12)