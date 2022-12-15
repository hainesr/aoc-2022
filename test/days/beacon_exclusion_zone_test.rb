# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/beacon_exclusion_zone'

class AOC2022::BeaconExclusionZoneTest < Minitest::Test
  INPUT = <<~EOI
    Sensor at x=2, y=18: closest beacon is at x=-2, y=15
    Sensor at x=9, y=16: closest beacon is at x=10, y=16
    Sensor at x=13, y=2: closest beacon is at x=15, y=3
    Sensor at x=12, y=14: closest beacon is at x=10, y=16
    Sensor at x=10, y=20: closest beacon is at x=10, y=16
    Sensor at x=14, y=17: closest beacon is at x=10, y=16
    Sensor at x=8, y=7: closest beacon is at x=2, y=10
    Sensor at x=2, y=0: closest beacon is at x=2, y=10
    Sensor at x=0, y=11: closest beacon is at x=2, y=10
    Sensor at x=20, y=14: closest beacon is at x=25, y=17
    Sensor at x=17, y=20: closest beacon is at x=21, y=22
    Sensor at x=16, y=7: closest beacon is at x=15, y=3
    Sensor at x=14, y=3: closest beacon is at x=15, y=3
    Sensor at x=20, y=1: closest beacon is at x=15, y=3
  EOI

  def setup
    @bez = AOC2022::BeaconExclusionZone.new
  end

  def test_read_map
    map = @bez.read_map(INPUT)

    assert_equal([2, 18], map[0][0])
    assert_equal([-2, 15], map[0][1])
    assert_equal(7, map[0][2])

    assert_equal([8, 7], map[6][0])
    assert_equal([2, 10], map[6][1])
    assert_equal(9, map[6][2])
  end

  def test_y_intersect
    map = @bez.read_map(INPUT)

    assert_equal(
      [-2, -1, 0, 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24],
      @bez.y_intersect(map, 10).sort
    )
  end

  def test_part1
    @bez.setup(INPUT)
    assert_equal(26, @bez.part1(10))
  end
end
