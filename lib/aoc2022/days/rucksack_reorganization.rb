# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

module AOC2022
  class RucksackReorganization < Day
    def setup(input = read_input_file.chomp)
      @rucksacks = input.split("\n").map do |line|
        half = line.length / 2
        [line[0...half], line[half..]].map(&:chars)
      end
    end

    def part1
      @rucksacks.map { |rucksack| priority(common_item_type(rucksack)) }.sum
    end

    def common_item_type((first, second))
      (first - (first - second))[0]
    end

    def priority(char)
      ord = char.ord

      ord > 96 ? (ord - 'a'.ord + 1) : (ord - 'A'.ord + 27)
    end
  end
end
