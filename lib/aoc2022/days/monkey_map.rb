# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

module AOC2022
  class MonkeyMap < Day
    DIRECTIONS = ['L', 'R'].freeze

    FACINGS = [
      [1, 0], [0, 1], [-1, 0], [0, -1]
    ].freeze

    def setup(input = read_input_file.chomp)
      @map, @directions = read_input(input)
      coords = @map.keys
      @max_x = coords.max_by { _1[0] }[0]
      @max_y = coords.max_by { _1[1] }[1]
    end

    def part1(start: [51, 1])
      (x, y), f = navigate(@map, @directions, start)
      (1000 * y) + (4 * x) + f
    end

    def navigate(map, directions, start)
      current_pos = start
      new_pos = []
      facing = 0

      directions.each do |direction|
        if DIRECTIONS.include?(direction)
          facing = turn(facing, direction)
        else
          direction.times do
            new_pos[0] = current_pos[0] + FACINGS[facing][0]
            new_pos[1] = current_pos[1] + FACINGS[facing][1]
            new_pos = wrap(map, new_pos, facing)
            break if map[new_pos] == '#'

            current_pos = new_pos.dup
          end
        end
      end

      [current_pos, facing]
    end

    def read_input(input)
      map, directions = input.split("\n\n")

      [read_map(map), read_directions(directions)]
    end

    private

    def wrap(map, pos, facing)
      if pos[0].zero?
        wrap(map, [@max_x, pos[1]], facing)
      elsif pos[0] > @max_x
        wrap(map, [1, pos[1]], facing)
      elsif pos[1].zero?
        wrap(map, [pos[0], @max_y], facing)
      elsif pos[1] > @max_y
        wrap(map, [pos[0], 1], facing)
      elsif map[pos].nil?
        new_pos = [pos[0] + FACINGS[facing][0], pos[1] + FACINGS[facing][1]]
        wrap(map, new_pos, facing)
      else
        pos
      end
    end

    def turn(facing, direction)
      facing += (direction == 'R' ? 1 : -1)
      facing % 4
    end

    def read_map(map)
      {}.tap do |grid|
        map.each_line(chomp: true).with_index do |line, y|
          line.each_char.with_index do |char, x|
            grid[[(x + 1), (y + 1)]] = (char == ' ' ? nil : char)
          end
        end
      end
    end

    def read_directions(directions)
      buffer = ''

      [].tap do |list|
        directions.each_char do |char|
          if DIRECTIONS.include?(char)
            list << buffer.to_i
            buffer = ''
            list << char
          else
            buffer += char
          end
        end

        list << buffer.to_i unless buffer.empty?
      end
    end
  end
end
