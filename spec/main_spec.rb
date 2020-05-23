# frozen_string_literal: true

require './main'

describe Enumerable do
  let (:integers_array) { [11, 2, 3, 56, 1] }
  let (:string_array) { %w[a b c d e] }
  let (:true_array) { [1, true, 'hi', []] }
  let (:arrange_array) { (5..10) }

  describe '#my_each' do
    it 'Check each method' do
      expect(integers_array.my_each { |x| p x }).to eql(5)
    end
  end

  describe '#my_each' do
    it 'Check each method' do
      expect(string_array.my_each { |x| p x }).to eql(5)
    end
  end

  describe '#my_each' do
    it 'Check each method' do
      expect(true_array.my_each { |x| p x }).to eql(4)
    end
  end

  describe '#my_each_with_index' do
    it 'Check each method' do
      expect(integers_array.my_each_with_index do |x, y|
        p "item[#{x}] -> #{y}"
      end).to eql(5)
    end
  end

  describe '#my_each_with_index' do
    it 'Check each method' do
      expect(string_array.my_each_with_index do |x, y|
        p "item[#{x}] -> #{y}"
      end).to eql(5)
    end
  end

  describe '#my_select' do
    it 'Check my_select' do
      expect(integers_array.my_select(&:even?)).to eql([2, 56])
    end
  end

  describe '#my_select' do
    it 'Check my_select' do
      expect(string_array.my_select { |x| x == 'c' }).to eql(['c'])
    end
  end

  describe '#my_all' do
    it 'Check my_all' do
      expect(integers_array.my_all?(Numeric)).to eql(true)
    end
  end

  describe '#my_all' do
    it 'Check my_all' do
      expect(integers_array.my_all?(String)).to eql(false)
    end
  end

  describe '#my_any' do
    it 'Check my_any' do
      expect(integers_array.my_any?(Integer)).to eql(true)
    end
  end

  describe '#my_any' do
    it 'Check my_any' do
      expect(integers_array.my_any?(1)).to eql(true)
    end
  end

  describe '#my_none' do
    it 'Check my_none' do
      expect(integers_array.my_none?(1)).to eql(false)
    end
  end

  describe '#my_none' do
    it 'Check my_none' do
      expect(integers_array.my_none?(0)).to eql(true)
    end
  end

  describe '#my_count' do
    it 'Check my_count' do
      expect(integers_array.my_count).to eql(5)
    end
  end

  describe '#my_count' do
    it 'Check my_count even' do
      expect(integers_array.my_count(&:even?)).to eql(2)
    end
  end

  describe '#my_count' do
    it 'Check my_count odd' do
      expect(integers_array.my_count(&:odd?)).to eql(3)
    end
  end

  describe '#my_map' do
    it 'Check my_map' do
      expect(integers_array.my_map { |x| x * x }).to eql([121, 4, 9, 3136, 1])
    end
  end

  describe '#my_map' do
    it 'Check my_map' do
      expect(integers_array.my_map { |x| x * 2 }).to eql([22, 4, 6, 112, 2])
    end
  end

  describe '#my_inject' do
    it 'Check my_inject' do
      expect(arrange_array.my_inject(:+)).to eql(45)
    end
  end

  describe '#my_inject' do
    it 'Check my_inject' do
      expect(arrange_array.my_inject { |sum, n| sum + n }).to eql(45)
    end
  end
end
