# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'
require_relative '../common/a_star'

module AOC2022
  class HillClimbingAlgorithm < Day
    def setup(input = read_input_file.chomp)
      @start, @finish, @map = read_map(input)
    end

    def part1
      climb(@start, @finish, @map)
    end

    def part2
      (0...@map.length).map do |y|
        climb([0, y], @finish, @map)
      end.min
    end

    def climb(start, finish, map)
      max_x = map[0].length - 1
      max_y = map.length - 1

      neighbours = lambda { |pos|
        x, y = pos
        can = map[y][x] + 1

        [[x, y - 1], [x - 1, y], [x, y + 1], [x + 1, y]].reject do |(a, b)|
          a.negative? || b.negative? || a > max_x || b > max_y || map[b][a] > can
        end
      }

      cost = lambda { |_|
        1
      }

      heuristic = lambda { |pos|
        x, y = pos
        ((finish[0] - x) + (finish[1] - y))
      }

      Common::AStar.solve(start, finish, neighbours, cost, heuristic)
    end

    def read_map(input)
      a = 'a'.ord
      start = nil
      finish = nil

      map = input.each_line(chomp: true).map.with_index do |line, y|
        line.chars.map.with_index do |char, x|
          case char
          when 'E'
            finish = [x, y]
            'z'.ord - a
          when 'S'
            start = [x, y]
            0
          else
            char.ord - a
          end
        end
      end

      [start, finish, map]
    end
  end
end
