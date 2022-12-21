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
    end

    def part1
      Hash.new do |h, k|
        math = @maths[k]
        h[k] = math.is_a?(Integer) ? math : h[math[0]].send(math[1], h[math[2]])
      end[:root]
    end

    def read_math(input)
      input.each_line(chomp: true).with_object({}) do |line, acc|
        monkey, math = line.split(': ')

        acc[monkey.to_sym] = math.length < 10 ? math.to_i : math.split.map(&:to_sym)
      end
    end
  end
end
