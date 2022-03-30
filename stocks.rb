def stock_picker(array)
  profit = array[1] - array[0]
  buy_day = 0
  sell_day = 1
  array.first(array.length - 1).each_with_index do |cost, subtrahend_index|
    array.last(array.length - (subtrahend_index + 1)).each_with_index do |income, minuend_index|
      if (income - cost) > profit
        profit = income - cost
        buy_day = subtrahend_index
        sell_day = minuend_index + subtrahend_index + 1
      end
    end
  end
  [buy_day, sell_day]
end

array = [17,3,6,9,15,8,6,1,10]

p stock_picker(array)