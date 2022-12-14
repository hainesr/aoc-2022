# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/regolith_reservoir'

class AOC2022::RegolithReservoirTest < Minitest::Test
  INPUT = <<~EOI
    498,4 -> 498,6 -> 496,6
    503,4 -> 502,4 -> 502,9 -> 494,9
  EOI

  def setup
    @rr = AOC2022::RegolithReservoir.new
  end

  def test_read_map
    map = @rr.read_map(INPUT)

    assert_equal(20, map.size)
    assert(map[[502, 6]])
    assert(map[[494, 9]])
    assert(map[[497, 6]])
    refute(map[[501, 4]])
    refute(map[[502, 3]])
    refute(map[[0, 0]])
  end

  def test_setup
    @rr.setup(INPUT)
    assert_equal(9, @rr.instance_variable_get(:@map_bottom))
  end

  def test_drop
    map = @rr.read_map(INPUT)

    assert(@rr.drop([500, 0], map, 9))
    assert(map[[500, 8]])

    assert(@rr.drop([500, 0], map, 9))
    assert(map[[499, 8]])

    assert(@rr.drop([500, 0], map, 9))
    assert(map[[501, 8]])

    assert(@rr.drop([500, 0], map, 9))
    assert(map[[500, 7]])

    assert_equal(24, map.size)
    refute(@rr.drop([493, 0], map, 9))
    refute(@rr.drop([494, 0], map, 9))
    assert_equal(24, map.size)
  end

  def test_part1
    @rr.setup(INPUT)
    assert_equal(24, @rr.part1)
  end
end
