# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

module AOC2022
  class CalorieCounting < Day
    def setup(input = read_input_file.chomp)
      @packs = parse_rations(input).map(&:sum)
    end

    def part1
      @packs.max
    end

    def part2
      @packs.sort[-3..].sum
    end

    def parse_rations(input)
      input.split("\n\n").map { |pack| pack.split.map(&:to_i) }
    end
  end
end
