# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

module AOC2022
  class GrovePositioningSystem < Day
    def setup(input = read_input_file.chomp)
      @coords = read_coords(input)
    end

    def part1
      coords = mix(@coords.dup)

      i = coords.find_index { |(_, c)| c.zero? }
      x = coords[(i + 1000) % coords.size][1]
      y = coords[(i + 2000) % coords.size][1]
      z = coords[(i + 3000) % coords.size][1]

      x + y + z
    end

    def mix(coords)
      coords.length.times do |i|
        pos = coords.find_index { |(n, _)| n == i }
        c = coords.delete_at(pos)
        coords.insert((pos + c[1]) % coords.length, c)
      end

      coords
    end

    def read_coords(input)
      input.each_line(chomp: true).map.with_index do |coord, i|
        [i, coord.to_i]
      end
    end
  end
end
