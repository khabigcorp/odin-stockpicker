def stock_picker(prices_per_day)
  max_profit = -1
  optimal_buy_day = 0
  optimal_sell_day = 0
  prices_per_day.slice(0, prices_per_day.length-1).each_with_index  do |current_day_price, current_day|
    rest_of_the_days = prices_per_day.slice(current_day+1, prices_per_day.length)
    max_profit_for_day = rest_of_the_days.max - current_day_price
    if (max_profit_for_day) >= max_profit
      optimal_buy_day = current_day
      # account for change in index caused by slicing
      optimal_sell_day = current_day + 1 + rest_of_the_days.each_with_index.max[1]
      max_profit = max_profit_for_day
    end
  end

  [optimal_buy_day, optimal_sell_day]
end

p stock_picker([15,3,6,9,12,8,6,1,0])