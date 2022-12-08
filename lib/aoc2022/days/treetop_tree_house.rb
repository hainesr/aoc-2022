# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

module AOC2022
  class TreetopTreeHouse < Day
    def setup(input = read_input_file.chomp)
      @map = read_map(input)
      process_map(@map)
    end

    def part1
      @map.flatten.count { _1[:visible] }
    end

    def process_map(map)
      [map, map.transpose].each do |grid|
        grid.each do |row|
          [row, row.reverse].each do |r|
            r.reduce([]) do |acc, tree|
              tree[:visible] = true if tree[:height] > (acc.max || -1)
              acc << tree[:height]
            end
          end
        end
      end
    end

    private

    def read_map(input)
      input.each_line(chomp: true).map do |line|
        line.chars.map do |char|
          { height: char.to_i, visible: false }
        end
      end
    end
  end
end
