# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

module AOC2022
  class MonkeyMath < Day
    def setup(input = read_input_file.chomp)
      @maths = read_math(input)
      @original = do_math(@maths)
    end

    def part1
      @original[:root]
    end

    def part2
      root_lhs, _, root_rhs = @maths[:root]
      human_zero = do_math(@maths.merge(humn: 0))

      # Which side to search?
      lhs_equal = human_zero[root_lhs] == @original[root_lhs]

      # What are the starting points?
      change_side, check_side = lhs_equal ? [root_rhs, root_lhs] : [root_lhs, root_rhs]
      check_equals = @original[check_side]
      start_cmp = human_zero[change_side] <=> check_equals

      # When this returns true then the value is not too small. The binary
      # search will use this to return the minimum value that is no longer too
      # small - at the inflection point we have the right value..
      search_cmp = lambda { |val|
        (do_math(@maths.merge(humn: val))[change_side] <=> check_equals) != start_cmp
      }

      # Choose a reasonable upper bound for the search by going too far.
      # A reasonable lower bound will then be upper_bound/step.
      step = 1024
      upper_bound = Enumerator.produce(1) { |val| val * step }.find(&search_cmp)
      lower_bound = upper_bound / step

      # Search between the limits we've found. Hooray for Ruby's bsearch.
      (lower_bound..upper_bound).bsearch(&search_cmp)
    end

    def do_math(maths)
      Hash.new do |h, k|
        math = maths[k]
        h[k] = math.is_a?(Integer) ? math : h[math[0]].send(math[1], h[math[2]])
      end
    end

    def read_math(input)
      input.each_line(chomp: true).with_object({}) do |line, acc|
        monkey, math = line.split(': ')

        acc[monkey.to_sym] = math.length < 10 ? math.to_i : math.split.map(&:to_sym)
      end
    end
  end
end
