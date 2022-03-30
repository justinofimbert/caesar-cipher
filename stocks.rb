def stock_picker(array)
  # initialize variable with an obvious value so we can use it later for comparisons
  profit = array[1] - array[0]

  # initialize these variables so we can return them later safely
  buy_day = 0
  sell_day = 1

  # loop through each value with index of the array except the last one as 
  # we won't have comparisons to make, as we can't sell later than the last day
  array.first(array.length - 1).each_with_index do |cost, subtrahend_index|

    # loop through each value with index that comes later than the buy_day
    array.last(array.length - (subtrahend_index + 1)).each_with_index do |income, minuend_index|

      # if the profits of this buy day and sell day combination surpasses the ones
      # of the previous best, then this is the new best combination to buy and sell.
      if (income - cost) > profit
        profit = income - cost
        buy_day = subtrahend_index

        sell_day = minuend_index + subtrahend_index + 1
      end
    end
  end
  # return value
  [buy_day, sell_day]
end

array = [17,3,6,9,15,8,6,1,10]

p stock_picker(array)