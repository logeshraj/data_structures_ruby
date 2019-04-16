def max_profit(prices)
  max_profit = 0
  i = 1
  while(i < prices.length)
    if (prices[i] > prices[i - 1])
      max_profit += prices[i] - prices[i - 1]
    end
    i += 1
  end
  max_profit
end