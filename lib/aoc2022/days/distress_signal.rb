# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

class Array
  alias _orig_cmp <=>

  def <=>(other)
    other.is_a?(Integer) ? _orig_cmp([other]) : _orig_cmp(other)
  end
end

class Integer
  alias _orig_cmp <=>

  def <=>(other)
    other.is_a?(Array) ? [self]._orig_cmp(other) : _orig_cmp(other)
  end
end

module AOC2022
  class DistressSignal < Day
    DIVIDERS = [
      [[2]],
      [[6]]
    ].freeze

    def setup(input = read_input_file.chomp)
      @pairs = read_pairs(input)
    end

    def part1
      @pairs.map { ordered?(_1) }.map.with_index do |result, i|
        result ? (i + 1) : nil
      end.compact.sum
    end

    def part2
      packets = (@pairs.flatten(1) + DIVIDERS).sort
      DIVIDERS.map { packets.find_index(_1) + 1 }.reduce(&:*)
    end

    def ordered?((left, right))
      (left <=> right).negative?
    end

    def read_pairs(input)
      input.split("\n\n").map do |packets|
        packets.split("\n").map { eval(_1) } # rubocop:disable Security/Eval
      end
    end
  end
end
