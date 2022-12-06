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
      @input.each_cons(4).with_index do |code, i|
        return i + 4 if code.uniq.length == 4
      end
    end
  end
end
