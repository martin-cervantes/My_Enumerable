#!/usr/bin/env ruby

# frozen_string_literal: true

#
# Extending Enumerable module with replicated methods for the following:
# each, each_with_index, select, all?, any? none?, count, map and inject
#
module Enumerable
  def my_each
    entry = is_a?(Range) ? to_a : self

    if block_given?
      entry.length.times { |i| yield(entry[i]) }
    else
      entry.to_enum
    end
  end

  def my_each_with_index
    entry = is_a?(Range) ? to_a : self

    if block_given?
      entry.length.times { |i| yield(i, entry[i]) }
    else
      entry.to_enum :each_with_index
    end
  end

  def my_select
    entry = is_a?(Range) ? to_a : self
    output = []

    if block_given?
      my_each { |i| (yield i) == true ? output << i : output }
      output
    else
      entry.to_enum :select
    end
  end

  def my_all?(*args, &block)
    entry = is_a?(Range) ? to_a : self
    result = true

    if entry.empty?
      result = true
    elsif !args[0].nil?
      if args[0].is_a? Class
        entry.my_each { |i| result = false unless i.is_a?(args[0]) }
      elsif args[0].is_a?(Regexp)
        entry.my_each { |i| result = false unless args[0].match(i) }
      else
        entry.my_each { |i| result = false unless i == args[0] }
      end
    elsif !block.nil?
      entry.my_each { |i| result = false unless block.call(i) }
    else
      entry.my_each { |i| result = false unless i }
    end

    result
  end

  def my_any?(*args, &block)
    entry = is_a?(Range) ? to_a : self
    result = false

    if entry.empty?
      result = false
    elsif !args[0].nil?
      if args[0].is_a? Class
        entry.my_each { |i| result = true if i.is_a?(args[0]) }
      elsif args[0].is_a?(Regexp)
        regex = entry.join(' ')
        result = true if regex =~ args[0]
      else
        entry.my_each { |i| result = true if i == args[0] }
      end
    elsif !block.nil?
      entry.my_each { |i| result = true if block.call(i) }
    else
      entry.my_each { |i| result = true if i }
    end

    result
  end

  def my_none?(*args, &block)
    entry = is_a?(Range) ? to_a : self
    result = true

    if entry.empty?
      result = true
    elsif !args[0].nil?
      if args[0].is_a? Class
        entry.my_each { |i| result = false if i.is_a?(args[0]) }
      elsif args[0].is_a?(Regexp)
        regex = entry.join(' ')
        result = false if regex =~ args[0]
      else
        entry.my_each { |i| result = false if i == args[0] }
      end
    elsif !block.nil?
      entry.my_each { |i| result = false if block.call(i) }
    else
      entry.my_each { |i| result = false if i }
    end

    result
  end

  def my_count(arg = nil)
    entry = is_a?(Range) ? to_a : self
    count = 0

    if block_given?
      my_each { |i| count += 1 if yield(i) }
    elsif arg
      my_each { |i| count += 1 if i == arg }
    else
      count = entry.length
    end

    count
  end

  def my_map(proc = nil)
    entry = is_a?(Range) ? to_a : self
    output = []

    if !proc.nil?
      entry.my_each { |i| output << proc.call(i) }
    elsif block_given?
      entry.my_each { |i| output << yield(i) }
    else
      result = entry.to_enum :map
    end

    !result.is_a?(Enumerator) ? output : result
  end

  def my_inject(*args, &proc)
    entry = is_a?(Range) ? to_a : self
    result = 0

    if entry[0].is_a?(Integer)
      if block_given?
        if args.size.zero?
          entry.my_each { |i| result = yield(result, i) }
        elsif args.size == 1
          result = args[0].to_i
          entry.my_each { |i| result = yield(result, i) }
        end
      else
        if args.size == 1
          op = args[0].to_s
          case op
          when '*'
            result = 1
          when '+'
            result = 0
          end
          entry.my_each { |i| result = result.to_i.send(op, i) }
        elsif args.size == 2
          op = args[1].to_s
          result = args[0].to_i
          entry.my_each { |i| result = result.to_i.send(op, i) }
        end
      end
    else
      entry.my_each { |i| result = proc.call(result.to_s, i.to_s) }
    end

    result
  end
end
