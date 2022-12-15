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
    sensors, beacons = @bez.read_map(INPUT)

    assert_equal(14, sensors.length)
    assert_equal(6, beacons.length)

    assert_equal([2, 18], sensors[0][0])
    assert_equal(7, sensors[0][1])

    assert_equal([8, 7], sensors[6][0])
    assert_equal(9, sensors[6][1])

    assert_equal([-2, 15], beacons[0])
    assert_equal([2, 10], beacons[3])
  end

  def test_y_intersect
    sensors, = @bez.read_map(INPUT)

    assert_equal([(-2..24)], @bez.y_intersect(sensors, 10).sort)
  end

  def test_part1
    @bez.setup(INPUT)
    assert_equal(26, @bez.part1(10))
  end
end
