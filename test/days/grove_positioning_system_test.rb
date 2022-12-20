# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/grove_positioning_system'

class AOC2022::GrovePositioningSystemTest < Minitest::Test
  INPUT = <<~EOI
    1
    2
    -3
    3
    -2
    0
    4
  EOI

  def setup
    @gps = AOC2022::GrovePositioningSystem.new
  end

  def test_read_coords
    assert_equal(
      [[0, 1], [1, 2], [2, -3], [3, 3], [4, -2], [5, 0], [6, 4]],
      @gps.read_coords(INPUT)
    )
  end

  def test_mix
    coords = @gps.read_coords(INPUT)
    assert_equal(
      [[4, -2], [0, 1], [1, 2], [2, -3], [6, 4], [5, 0], [3, 3]],
      @gps.mix(coords)
    )
  end

  def test_part1
    @gps.setup(INPUT)
    assert_equal(3, @gps.part1)
  end

  def test_part2
    @gps.setup(INPUT)
    assert_equal(1_623_178_306, @gps.part2)
  end
end
