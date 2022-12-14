# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

module AOC2022
  class RegolithReservoir < Day
    ENTRY_POINT = [500, 0].freeze

    def setup(input = read_input_file.chomp)
      @map = read_map(input)
      @map_bottom = @map.keys.max_by { _1[1] }[1]
    end

    def part1
      u = 0

      u += 1 while drop(ENTRY_POINT, @map, @map_bottom)

      u
    end

    def drop((x, y), map, bottom)
      loop do
        loop do
          return false if y == bottom
          break if map[[x, (y + 1)]]

          y += 1
        end

        if !map[[(x - 1), (y + 1)]]
          x -= 1
          y += 1
        elsif !map[[(x + 1), (y + 1)]]
          x += 1
          y += 1
        else
          break
        end
      end

      map[[x, y]] = true
    end

    def read_map(input)
      Hash.new(false).tap do |map|
        input.each_line(chomp: true) do |line|
          coords = line.split(' -> ').map { _1.split(',').map(&:to_i) }
          coords.each_cons(2) do |((x1, y1), (x2, y2))|
            if x1 == x2
              y1, y2 = y2, y1 if y1 > y2
              (y1..y2).each { map[[x1, _1]] = true }
            else
              x1, x2 = x2, x1 if x1 > x2
              (x1..x2).each { map[[_1, y1]] = true }
            end
          end
        end
      end
    end
  end
end
