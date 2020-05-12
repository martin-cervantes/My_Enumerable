#!/usr/bin/env ruby

# frozen_string_literal: true

#
# Extending Enumerable module with replicated methods for the following:
# each, each_with_index, select, all?, any? none?, count, map and inject
#
module Enumerable
  def my_each
    entry = is_a?(Range) ? to_a : self
    result = ''

    if block_given?
      entry.length.times { |i| yield(i, entry[i]) }
    else
      result = entry.to_enum
    end

    !result.is_a?(Enumerator) ? entry : result
  end
end

test_array1 = [11, 2, 3, 56]

test_array2 = %w[a b c d]

true_array = [1, true, 'hi', []]

false_array = [nil, false, nil, false]

words = %w[dog door rod blade]

# my_each

p 'my_each'

test_array1.my_each { |x| p x }

test_array2.my_each { |x| p x }

p test_array2.my_each

array = [1, 2, 3, 5, 1, 7, 3, 4, 5, 7, 2, 3, 2, 0, 8, 8, 7, 8, 1, 6, 1, 1, 7, 2,
         1, 2, 5, 8, 6, 0, 4, 5, 8, 2, 2, 5, 4, 7, 3, 4, 3, 3, 8, 5, 1, 0, 3, 7,
         5, 5, 7, 2, 6, 7, 7, 0, 4, 4, 0, 2, 0, 6, 6, 8, 1, 6, 8, 6, 2, 3, 6, 1,
         5, 2, 6, 7, 2, 5, 8, 2, 0, 7, 3, 2, 3, 6, 1, 2, 8, 3, 7, 0, 5, 0, 0, 2,
         6, 1, 5, 2]

my_each_output = ''

block = proc { |num| my_each_output += num.to_s }

array.my_each(&block)

p my_each_output
