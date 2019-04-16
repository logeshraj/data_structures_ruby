def fib(n)
  # dp = []
  n_minus1 = 0
  n_minus2 = 1
  i = 2
  while(i <= n)
    dp_n = n_minus1 + n_minus2
    n_minus1 = n_minus2
    n_minus2 = dp_n
    i += 1
  end
  dp_n
end

puts fib(100000)