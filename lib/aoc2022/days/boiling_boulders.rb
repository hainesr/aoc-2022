# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

module AOC2022
  class BoilingBoulders < Day
    def setup(input = read_input_file.chomp)
      @boulders = read_boulders(input)
    end

    def part1 # rubocop:disable Metrics/AbcSize
      groups = {
        xy: Hash.new { |h, k| h[k] = [] },
        yz: Hash.new { |h, k| h[k] = [] },
        zx: Hash.new { |h, k| h[k] = [] }
      }

      @boulders.each do |(x, y, z)|
        groups[:xy][[x, y]] << z
        groups[:yz][[y, z]] << x
        groups[:zx][[z, x]] << y
      end

      groups = groups.values.map(&:values).flatten(1).select { _1.length > 1 }
      joined = groups.reduce(0) do |acc, sides|
        sides.sort.each_cons(2) { |a, b| acc += (a + 1 == b ? 1 : 0) }
        acc
      end

      (@boulders.length * 6) - (joined * 2)
    end

    def read_boulders(input)
      input.each_line(chomp: true).map do |line|
        line.split(',').map(&:to_i)
      end
    end
  end
end
