# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

module AOC2022
  class TuningTrouble < Day
    def setup(input = read_input_file.chomp)
      @input = input.chars
    end

    def part1
      detect(4)
    end

    def part2
      detect(14)
    end

    private

    def detect(size)
      @input.each_cons(size).with_index do |code, i|
        return i + size if code.uniq.length == size
      end
    end
  end
end
