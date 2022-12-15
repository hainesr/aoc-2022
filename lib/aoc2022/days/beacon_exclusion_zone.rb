# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

module AOC2022
  class BeaconExclusionZone < Day
    def setup(input = read_input_file.chomp)
      @sensors, @beacons = read_map(input)
    end

    def part1(y = 2_000_000)
      merge(y_intersect(@sensors, y)).sum(&:size) - @beacons.count { _1[1] == y }
    end

    def y_intersect(map, y)
      map.map do |((sx, sy), distance)|
        y_range = ((sy - distance)..(sy + distance))
        next unless y_range.cover?(y)

        half_span = distance - (y - sy).abs
        ((sx - half_span)..(sx + half_span))
      end.compact
    end

    def read_map(input)
      beacons = []

      sensors = input.each_line(chomp: true).map do |line|
        sensor, beacon = line.split(': closest beacon is at ')
        sx, sy = sensor[12..].split(', y=').map(&:to_i)
        bx, by = beacon[2..].split(', y=').map(&:to_i)

        beacons << [bx, by]
        [[sx, sy], manhattan_distance(sx, sy, bx, by)]
      end

      [sensors, beacons.uniq]
    end

    private

    def manhattan_distance(x1, y1, x2, y2)
      (x2 - x1).abs + (y2 - y1).abs
    end

    def merge(ranges_list)
      [].tap do |ranges|
        ranges_list.sort_by(&:first).each do |range|
          if ranges.last&.last&.>= range.begin
            ranges[-1] = union(ranges[-1], range)
          else
            ranges << range
          end
        end
      end
    end

    def union(one, other)
      ([one.min, other.min].min..[one.max, other.max].max)
    end
  end
end
