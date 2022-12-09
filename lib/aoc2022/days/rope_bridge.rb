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

    attr_reader :head, :moves, :tail, :tail_visited

    def setup(input = read_input_file.chomp)
      @moves = read_moves(input)
      @head = [0, 0]
      @tail = [0, 0]
      @tail_visited = Hash.new(0)
      @tail_visited[[0, 0]] = 1
    end

    def part1
      @moves.each { |move| move(move) }
      @tail_visited.keys.length
    end

    def move(head_move)
      @head = [@head[0] + head_move[0], @head[1] + head_move[1]]
      dist = [@head[0] - @tail[0], @head[1] - @tail[1]]
      return if dist.map(&:abs).max < 2

      tail_move = dist.map do |d|
        case d
        when -2
          -1
        when 2
          1
        else
          d
        end
      end

      @tail = [@tail[0] + tail_move[0], @tail[1] + tail_move[1]]
      @tail_visited[@tail] += 1
    end

    def read_moves(input)
      moves = []

      input.each_line(chomp: true) do |line|
        dir, distance = line.split
        distance.to_i.times { moves << DIRECTIONS[dir] }
      end

      moves
    end
  end
end
