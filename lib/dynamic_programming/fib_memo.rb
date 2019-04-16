def fib(n)
  return @dp[n] if @dp[n]
  if n == 0
    @dp[n] = 0
    return 0 
  elsif n <= 1
    @dp[n] = 1
  end
  @dp[n] = fib(n-1)+fib(n-2)
  @dp[n]
end

@dp = []
puts fib(100000)