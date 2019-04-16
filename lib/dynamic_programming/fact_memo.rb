def fact_memo(n)
  return 1 if n <= 1
  n*fact_memo(n-1)
end

@memo = []
puts fact_memo(99)