require_relative 'spec_helper'

describe Solution do
  let(:solution) { described_class.new }

  describe '#load_arr' do
    it 'loads input' do
      solution.load_arr

      expect(solution.arr.uniq.size).to eq 100000

      any = solution.arr.first
      expect(any).to be_a Integer
      expect(any).to be <= 100000
      expect(any).to be >= 1
    end
  end

  describe '#solve' do
    subject(:s) { solution.method :solve }

    before do
      allow(solution).to receive(:load_arr)
    end

    specify do
      solution.arr = [1,2,3,4,5,6]
      s.call
      expect(solution.result_arr).to eq [1,2,3,4,5,6]
      expect(solution.total_count).to eq 0
    end

    specify do
      solution.arr = [6,1,2,3,4,5]
      s.call
      expect(solution.result_arr).to eq [1,2,3,4,5,6]
      expect(solution.total_count).to eq 5
    end

    specify do
      solution.arr = [6,1,3,4,2,5]
      s.call
      expect(solution.result_arr).to eq [1,2,3,4,5,6]
      expect(solution.total_count).to eq 7
    end

    specify do
      solution.arr = [6, 5, 8, 9, 12, 7, 11, 17, 14, 3, 1, 18, 13, 20, 2, 15, 4, 16, 10, 19]
                   # [5, 4, 5, 5,  7, 4,  5,  9,  6, 2, 0,  6,  3,  6, 0,  2, 0,  1,  0,  0]
      s.call
      expect(solution.result_arr).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
      expect(solution.total_count).to eq 70
    end
  end

  describe '#solve_straight' do
    subject(:s) { solution.method :solve_straight }

    specify do
      solution.arr = [1,2,3,4,5,6]
      s.call
      expect(solution.total_count).to eq 0
    end

    specify do
      solution.arr = [6,1,2,3,4,5]
      s.call
      expect(solution.total_count).to eq 5
    end

    specify do
      solution.arr = [6,1,3,4,2,5]
      s.call
      expect(solution.total_count).to eq 7
    end

    specify do
      solution.arr = [6, 5, 8, 9, 12, 7, 11, 17, 14, 3, 1, 18, 13, 20, 2, 15, 4, 16, 10, 19]
                   # [5, 4, 5, 5,  7, 4,  5,  9,  6, 2, 0,  6,  3,  6, 0,  2, 0,  1,  0,  0]
      s.call
      expect(solution.total_count).to eq 70
    end
  end

  describe '#sort_and_calc' do
    subject(:s) { solution.method :sort_and_calc }

    specify do
      arr1 = [1,2,3]
      arr2 = [4,5,6]
      expect(s.call(arr1, arr2)).to eq [1,2,3,4,5,6]
      expect(solution.total_count).to eq 0
    end

    specify do
      arr1 = [4,5,6]
      arr2 = [1,2,3]
      expect(s.call(arr1, arr2)).to eq [1,2,3,4,5,6]
      expect(solution.total_count).to eq 9
    end

    specify do
      arr1 = [1,2,6]
      arr2 = [3,4,5]
      expect(s.call(arr1, arr2)).to eq [1,2,3,4,5,6]
      expect(solution.total_count).to eq 3
    end

    specify do
      arr1 = [2,3,4]
      arr2 = [1,5,6]
      expect(s.call(arr1, arr2)).to eq [1,2,3,4,5,6]
      expect(solution.total_count).to eq 3
    end

    specify do
      arr1 = [1,3,4]
      arr2 = [2,5,6]
      expect(s.call(arr1, arr2)).to eq [1,2,3,4,5,6]
      expect(solution.total_count).to eq 2
    end
  end

  describe '#divide' do
    subject(:s) { solution.method :divide }

    specify do
      input = []
      expect{ s.call(input) }.to raise_error ArgumentError
    end

    specify do
      input = [1]
      expect{ s.call(input) }.to raise_error ArgumentError
    end

    specify do
      input = [1,2]
      expect(s.call(input)).to eq [[1],[2]]
    end

    specify do
      input = [1,2,3]
      expect(s.call(input)).to eq [[1,2],[3]]
    end

    specify do
      input = [1,2,3,4]
      expect(s.call(input)).to eq [[1,2],[3,4]]
    end
  end
end
