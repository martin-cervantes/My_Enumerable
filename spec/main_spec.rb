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
end
