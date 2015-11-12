require 'pry'
require 'awesome_print'
require_relative 'straight_forward'

class Solution
  include StraightForward

  attr_accessor :arr, :result_arr, :total_count

  def initialize
    @total_count = 0
  end

  def solve
    load_arr

    return 0 if arr.length < 2

    self.result_arr = find_solution_for arr
    total_count
  end

  def find_solution_for(array)
    if array.length == 1
      return array
    else
      left_arr, right_arr = divide(array)
      sorted_left_arr = find_solution_for(left_arr)
      sorted_right_arr = find_solution_for(right_arr)
    end

    return sort_and_calc(sorted_left_arr, sorted_right_arr)
  end

  def load_arr
    @arr = []

    File.open("./integer_array.txt", "r") do |file|
      while (line = file.gets)
        @arr << line.strip.to_i
      end
    end
  end

  def divide(big_arr)
    raise ArgumentError if big_arr.length < 2
    middle = (big_arr.length.to_f / 2 - 1).ceil
    [big_arr.slice(0..middle), big_arr.slice(middle + 1..-1).to_a]
  end

  def sort_and_calc left_arr, right_arr
    result = []
    i, j = 0, 0

    (left_arr.length + right_arr.length).times do |k|
      raise 'something strange' if left_arr[i].nil? && right_arr[j].nil?

      if !left_arr[i].nil? && (right_arr[j].nil? || left_arr[i] <= right_arr[j])
        result[k] = left_arr[i]
        self.total_count += j
        i += 1
      else
        result[k] = right_arr[j]
        j += 1
      end
    end

    return result
  end
end
