module StraightForward
  def solve_straight
    arr.each_with_index do |x, i|
      ap i if i % 100 == 0
      for j in i+1..arr.length-1
        self.total_count += 1 if arr[i] > arr[j]
      end
    end
  end
end
