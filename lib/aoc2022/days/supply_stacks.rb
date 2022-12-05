# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

module AOC2022
  class SupplyStacks < Day
    def setup(input = read_input_file.chomp)
      stacks, moves = input.split("\n\n")
      @stacks = read_stacks(stacks)
      @moves = read_moves(moves)
    end

    def part1
      process_moves
    end

    def process_moves(cm9001: false)
      stacks = @stacks.map(&:dup)
      @moves.each { move(stacks, _1, cm9001:) }

      stacks.map do |stack|
        stack[-1]
      end.join
    end

    def move(stacks = @stacks, (num, from, to), cm9001: false)
      crates = stacks[from - 1].pop(num)
      stacks[to - 1] += (cm9001 ? crates : crates.reverse)
    end

    def read_stacks(input)
      num_stacks = input[-2..].to_i
      stacks = Array.new(num_stacks) { [] }

      input.each_line(chomp: true).map do |line|
        next if line[1] == '1'

        num_stacks.times do |i|
          crate = line[1 + (i * 4)]
          stacks[i] << crate unless crate == ' ' || crate.nil?
        end
      end

      stacks.map(&:reverse)
    end

    def read_moves(input)
      input.each_line(chomp: true).map do |line|
        num, rest = line[5..].split(' from ')
        from, to = rest.split(' to ')
        [num, from, to].map(&:to_i)
      end
    end
  end
end
