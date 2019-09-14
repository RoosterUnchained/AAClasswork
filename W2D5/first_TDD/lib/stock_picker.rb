def stock_picker(prices)
  best_pair = []
  max_profit = 0
  prices.each_with_index do |el1, i|
    prices.each_with_index do |el2, j|
      if i < j
        profit = el2 - el1
        if max_profit < profit
          max_profit = profit
          best_pair = [i, j]
        end
      end
    end
  end
  best_pair
end