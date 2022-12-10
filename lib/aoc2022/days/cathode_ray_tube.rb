# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

module AOC2022
  class CathodeRayTube < Day
    def setup(input = read_input_file.chomp)
      @code = read_instructions(input)
    end

    def part1
      run_code(@code, [20, 60, 100, 140, 180, 220]).values.sum
    end

    def run_code(code, collect)
      cycle = 0
      x = 1
      strengths = {}

      code.each do |add|
        cycle += 1
        strengths[cycle] = cycle * x if collect.include?(cycle)

        next if add.zero?

        cycle += 1
        strengths[cycle] = cycle * x if collect.include?(cycle)
        x += add
      end

      strengths
    end

    def read_instructions(input)
      input.each_line(chomp: true).map do |line|
        _, operand = line.split
        operand.nil? ? 0 : operand.to_i
      end
    end
  end
end
