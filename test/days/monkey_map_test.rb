# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/monkey_map'

class AOC2022::MonkeyMapTest < Minitest::Test
  INPUT = <<~EOI
            ...#
            .#..
            #...
            ....
    ...#.......#
    ........#...
    ..#....#....
    ..........#.
            ...#....
            .....#..
            .#......
            ......#.

    10R5L5R10L4R5L5
  EOI

  DIRECTIONS = [10, 'R', 5, 'L', 5, 'R', 10, 'L', 4, 'R', 5, 'L', 5].freeze

  def setup
    @mm = AOC2022::MonkeyMap.new
  end

  def test_read_input
    map, directions = @mm.read_input(INPUT)

    assert_nil(map[[1, 1]])
    assert_equal('.', map[[9, 1]])
    assert_equal('#', map[[9, 3]])
    assert_equal('#', map[[15, 12]])
    assert_equal('.', map[[16, 12]])

    assert_equal(DIRECTIONS, directions)
  end

  def test_setup
    @mm.setup(INPUT)

    assert_equal(16, @mm.instance_variable_get(:@max_x))
    assert_equal(12, @mm.instance_variable_get(:@max_y))
  end

  def test_part1
    @mm.setup(INPUT)
    assert_equal(6032, @mm.part1(start: [9, 1]))
  end
end
