def bubble_sort(unsorted_array)
  array = unsorted_array.map(&:clone)
  (array.length - 1).downto(1) do |number_of_comparisons|
    number_of_comparisons.times do |index|
      if array[index] > array[index + 1]
        temp = array[index]
        array[index] = array[index + 1]
        array[index + 1] = temp
      end
    end
  end
  array
end

array = [4,3,78,2,0,2,5,2,6,89,3,6,8,3,7,4,6,34,57,23,68,89,43,21,67,87934,76]

p bubble_sort(array)