# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

module AOC2022
  class CampCleanup < Day
    def setup(input = read_input_file.chomp)
      @ranges = input.split("\n").map do |line|
        line.split(',').map do |range|
          min, max = range.split('-')
          (min.to_i..max.to_i)
        end
      end
    end

    def part1
      @ranges.count { |sections| sections_covered?(sections) }
    end

    def part2
      @ranges.count { |sections| sections_overlap?(sections) }
    end

    def sections_covered?((first, second))
      first.cover?(second) || second.cover?(first)
    end

    def sections_overlap?((first, second))
      first.min < second.min ? first.max >= second.min : second.max >= first.min
    end
  end
end
