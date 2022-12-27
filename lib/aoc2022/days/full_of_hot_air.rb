# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

module AOC2022
  class FullOfHotAir < Day
    TO_DECIMAL = {
      '=' => -2,
      '-' => -1,
      '0' => 0,
      '1' => 1,
      '2' => 2
    }.freeze

    TO_SNAFU = {
      -2 => '=',
      -1 => '-',
      0 => '0',
      1 => '1',
      2 => '2'
    }.freeze

    def setup(input = read_input_file.chomp)
      @input = input
    end

    def part1
      @input.each_line(chomp: true).reduce('') do |acc, line|
        add_snafu(acc, line)
      end
    end

    def add_snafu(s1, s2)
      digits = []
      i = 0
      carry = 0
      s1 = s1.reverse
      s2 = s2.reverse

      while i < s1.length || i < s2.length || carry != 0
        value = carry + TO_DECIMAL.fetch(s1[i], 0) + TO_DECIMAL.fetch(s2[i], 0)
        carry = 0

        if value < -2
          value += 5
          carry = -1
        end
        if value > 2
          value -= 5
          carry = 1
        end

        digits << TO_SNAFU[value]
        i += 1
      end

      digits.reverse.join
    end
  end
end
