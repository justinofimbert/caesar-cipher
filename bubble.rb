def bubble_sort(unsorted_array)
  # create a clone of the unsorted array, so we can operate safely over its data
  array = unsorted_array.map(&:clone)

  # for the first iteration, we need to do array.length - 1 comparisons over the array
  # but after each loop through the array, we have to do one less comparison
  # so this loop has as its variable, the number of comparisons that it NEEDS to make
  (array.length - 1).downto(1) do |number_of_comparisons|

    # inside this other loop, we make number_of_comparisons iterations over the array
    number_of_comparisons.times do |index|

      # if current value > next value then...
      if array[index] > array[index + 1]

        # swap positions
        temp = array[index]
        array[index] = array[index + 1]
        array[index + 1] = temp
      end
    end
  end
  
  # return value:
  array
end

array = [4,3,78,2,0,2,5,2,6,89,3,6,8,3,7,4,6,34,57,23,68,89,43,21,67,87934,76]

p bubble_sort(array)