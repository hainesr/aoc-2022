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

    def part2
      @rucksacks.each_slice(3).reduce(0) do |acc, rucksacks|
        acc + priority(common_item_type3(rucksacks))
      end
    end

    def common_item_type((first, second))
      (first - (first - second))[0]
    end

    def common_item_type3(rucksacks)
      groups = rucksacks.map { |(first, second)| (first + second).group_by { _1 }.keys }
      groups.flatten.group_by { _1 }.select { |_, v| v.length == 3 }.keys[0]
    end

    def priority(char)
      ord = char.ord

      ord > 96 ? (ord - 'a'.ord + 1) : (ord - 'A'.ord + 27)
    end
  end
end
