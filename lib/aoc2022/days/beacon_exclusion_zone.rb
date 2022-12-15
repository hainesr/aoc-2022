# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'
require 'set'

module AOC2022
  class BeaconExclusionZone < Day
    def setup(input = read_input_file.chomp)
      @map = read_map(input)
    end

    def part1(y = 2_000_000)
      y_intersect(@map, y).size
    end

    def y_intersect(map, y)
      hit = Set.new
      beacons_at_y = Set.new

      map.each do |((sx, sy), (bx, by), distance)|
        y_range = ((sy - distance)..(sy + distance))
        beacons_at_y << bx if by == y
        next unless y_range.cover?(y)

        half_span = distance - (y - sy).abs
        intersect_range = ((sx - half_span)..(sx + half_span))

        intersect_range.each { hit << _1 }
      end

      hit - beacons_at_y
    end

    def read_map(input)
      input.each_line(chomp: true).map do |line|
        sensor, beacon = line.split(': closest beacon is at ')
        sx, sy = sensor[12..].split(', y=').map(&:to_i)
        bx, by = beacon[2..].split(', y=').map(&:to_i)

        [[sx, sy], [bx, by], manhattan_distance(sx, sy, bx, by)]
      end
    end

    private

    def manhattan_distance(x1, y1, x2, y2)
      (x2 - x1).abs + (y2 - y1).abs
    end
  end
end
