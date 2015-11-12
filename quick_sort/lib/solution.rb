require 'pry'
require 'awesome_print'

class Solution
  attr_accessor :arr, :result_arr, :total_count

  def initialize
    @total_count = 0
  end

  def load_arr
    @arr = []

    File.open("./array.txt", "r") do |file|
      while (line = file.gets)
        @arr << line.strip.to_i
      end
    end
  end

  def solve
    load_arr
    # @arr = [3, 12, 10, 13, 9, 16, 11, 6, 19, 4, 1, 7, 14, 20, 5, 2, 15, 8, 18, 17]

    return 0 if arr.length < 2

    self.result_arr = find_solution_for arr
    total_count
  end

  def find_solution_for(array)
    return array if array.size < 2
    self.total_count += array.length - 1
    # for case 2 ------------------------
    # temp = array[-1]
    # array[-1] = array[0]
    # array[0] = temp
    # -----------------------------------

    # for case 3 ------------------------
    middle_index = if array.size.even?
      (array.size / 2) -1
    else
      (array.size - 1) / 2
    end

    pivot_index = [[0, array[0]], [middle_index, array[middle_index]], [array.size - 1, array[-1]]].sort_by {|x| x[1]}[1][0]

    temp = array[pivot_index]
    array[pivot_index] = array[0]
    array[0] = temp
    # -----------------------------------

    pivot = array[0]
    i = 1

    (1..array.length-1).each do |j|
      if array[j] < pivot
        temp = array[j]
        array[j] = array[i]
        array[i] = temp
        i += 1
      end
    end

    array[0] = array[i-1]
    array[i-1] = pivot

    left_partition = array.slice(0, i-1).to_a
    pivot_partition = [array[i-1]]
    right_partition = array[i..-1]

    return find_solution_for(left_partition) + pivot_partition + find_solution_for(right_partition)
  end
end
