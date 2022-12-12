# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/hill_climbing_algorithm'

class AOC2022::HillClimbingAlgorithmTest < Minitest::Test
  INPUT = <<~EOI
    Sabqponm
    abcryxxl
    accszExk
    acctuvwj
    abdefghi
  EOI

  MAP = [
    [0, 0, 1, 16, 15, 14, 13, 12],
    [0, 1, 2, 17, 24, 23, 23, 11],
    [0, 2, 2, 18, 25, 25, 23, 10],
    [0, 2, 2, 19, 20, 21, 22, 9],
    [0, 1, 3, 4, 5, 6, 7, 8]
  ].freeze

  def setup
    @hca = AOC2022::HillClimbingAlgorithm.new
  end

  def test_read_map
    start, finish, map = @hca.read_map(INPUT)

    assert_equal([0, 0], start)
    assert_equal([5, 2], finish)
    assert_equal(MAP, map)
  end

  def test_climb
    start, finish, map = @hca.read_map(INPUT)
    assert_equal(31, @hca.climb(start, finish, map))
  end

  def test_part1
    @hca.setup(INPUT)
    assert_equal(31, @hca.part1)
  end
end
