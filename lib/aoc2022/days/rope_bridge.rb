# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

module AOC2022
  class RopeBridge < Day
    DIRECTIONS = {
      'L' => [-1, 0],
      'R' => [1, 0],
      'U' => [0, 1],
      'D' => [0, -1]
    }.freeze

    ROPE_LENGTH = 10
    TAIL_LENGTH = ROPE_LENGTH - 1

    def setup(input = read_input_file.chomp)
      moves = read_moves(input)
      rope = [[0, 0]] * ROPE_LENGTH
      @tail_visited = [Hash.new(0), Hash.new(0)]

      moves.each { |move| move(rope, move, @tail_visited) }
    end

    def part1
      @tail_visited[0].keys.length
    end

    def part2
      @tail_visited[1].keys.length
    end

    def move(rope, head_move, visited) # rubocop:disable Metrics/AbcSize
      rope[0] = [rope[0][0] + head_move[0], rope[0][1] + head_move[1]]
      rope[1..].each.with_index do |tail, i|
        dist = [rope[i][0] - tail[0], rope[i][1] - tail[1]]
        next if dist.map(&:abs).max < 2

        tail_move = tail_move(dist)
        rope[i + 1] = [tail[0] + tail_move[0], tail[1] + tail_move[1]]
      end

      visited[0][rope[1]] += 1
      visited[1][rope[TAIL_LENGTH]] += 1
    end

    def read_moves(input)
      moves = []

      input.each_line(chomp: true) do |line|
        dir, distance = line.split
        distance.to_i.times { moves << DIRECTIONS[dir] }
      end

      moves
    end

    private

    def tail_move(offset)
      offset.map do |d|
        case d
        when -2
          -1
        when 2
          1
        else
          d
        end
      end
    end
  end
end
