def max_profit(prices)
  minPrice = (2**(0.size * 8 -2) -1)
  max_profit = 0
  prices.each do |price|
    minPrice = price if price < minPrice
    profit = price - minPrice
    max_profit = profit if profit > max_profit
  end
  max_profit
end