# frozen_string_literal: true

require './main'

describe Enumerable do
  describe '#my_each' do
    it 'Check each method' do
      expect([11, 2, 3, 56].my_each { |x| p x }).to eql(4)
    end
  end

  describe '#my_each' do
    it 'Check each method' do
      expect(%w[a b c d].my_each { |x| p x }).to eql(4)
    end
  end

  describe '#my_each' do
    it 'Check each method' do
      expect([1, true, 'hi', []].my_each { |x| p x }).to eql(4)
    end
  end

  describe '#my_each_with_index' do
    it 'Check each method' do
      expect([11, 2, 3, 56].my_each_with_index do |x, y|
        p "item[#{x}] -> #{y}"
      end).to eql(4)
    end
  end

  describe '#my_each_with_index' do
    it 'Check each method' do
      expect(%w[a b c d].my_each_with_index do |x, y|
        p "item[#{x}] -> #{y}"
      end).to eql(4)
    end
  end

  describe '#my_select' do
    it 'Check my_select' do
      expect([11, 2, 3, 56].my_select(&:even?)).to eql([2, 56])
    end
  end

  describe '#my_select' do
    it 'Check my_select' do
      expect(%w[a b c d].my_select { |x| x == 'c' }).to eql(['c'])
    end
  end

  describe '#my_all' do
    it 'Check my_all' do
      expect([1, 2].my_all?(Numeric)).to eql(true)
    end
  end

  describe '#my_all' do
    it 'Check my_all' do
      expect([1, 2].my_all?(String)).to eql(false)
    end
  end

  describe '#my_any' do
    it 'Check my_any' do
      expect([nil, true, 99].my_any?(Integer)).to eql(true)
    end
  end

  describe '#my_any' do
    it 'Check my_any' do
      expect([1, 2].my_any?(1)).to eql(true)
    end
  end

  describe '#my_none' do
    it 'Check my_none' do
      expect([1, 2].my_none?(1)).to eql(false)
    end
  end

  describe '#my_none' do
    it 'Check my_none' do
      expect([1, 2].my_none?(0)).to eql(true)
    end
  end

  describe '#my_count' do
    it 'Check my_count' do
      expect([1, 2].my_count).to eql(2)
    end
  end

  describe '#my_count' do
    it 'Check my_count even' do
      expect([1, 2].my_count(&:even?)).to eql(1)
    end
  end

  describe '#my_count' do
    it 'Check my_count odd' do
      expect([1, 2].my_count(&:odd?)).to eql(1)
    end
  end

  describe '#my_map' do
    it 'Check my_map' do
      expect([1, 2, 7, 4, 5].my_map { |x| x * x }).to eql([1, 4, 49, 16, 25])
    end
  end

  describe '#my_map' do
    it 'Check my_map' do
      expect([1, 2, 7, 4, 5].my_map { |x| x * 2 }).to eql([2, 4, 14, 8, 10])
    end
  end

  describe '#my_inject' do
    it 'Check my_inject' do
      expect((5..10).my_inject(:+)).to eql(45)
    end
  end

  describe '#my_inject' do
    it 'Check my_inject' do
      expect((5..10).my_inject { |sum, n| sum + n }).to eql(45)
    end
  end
end
